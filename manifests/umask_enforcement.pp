# Solaris_tidy::Umask_enforcement
#
# Enforce correct umask enforcement by editing /etc/profile and /etc/.login
class solaris_tidy::umask_enforcement {

  $run_fix =
  'cd /etc && for file in profile .login ; do
    if [ "`grep umask $file`" ]; then
      awk \'$1 == "umask" { $2 = "077" } { print }\' $file > $file.new && mv $file.new $file
    else
      echo "umask 077" >> $file
    fi
    pkgchk -f -n -p $file
  done'

  $run_needed = 'bash -c "grep umask /etc/profile /etc/.login | grep -v \'umask 077\' "'

  exec { "remove umask in /etc/profile and /etc/.login":
    command => $run_fix,
    onlyif  => $run_needed,
    path    => ['/usr/bin', '/bin', '/usr/sbin', '/sbin'],
  }

}
