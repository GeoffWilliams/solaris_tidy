# Solaris_tidy::Password_policy_enforcement
#
# Run a script to determine the users who have non-compliant passwords and
# apply limits to them by setting the -x -n -w options to passwd
class solaris_tidy::password_policy_enforcement {

  # Appears to inspec the extended output of the logins command to to write out
  # a command to run to add mandatory password policy rules to matching accounts
  # I have no idea what all the flags mean.
  # Results in ouptput like this:
  #  passwd -x 91 -n 7 -w 28 foobar
  #
  # Words fail me...
  $script = 'logins -ox | awk -F: \' ($1 == "root" || $8 == "LK" ||$8 == "NL") {\\
next } ; { $cmd = "passwd" } ; ($11 <= 0 || $11 > 91) { $cmd = $cmd " -x 91" } \\
($10 < 7) { $cmd = $cmd " -n 7" } ($12 < 28) { $cmd = $cmd " -w 28" } ($cmd != "passwd") \\
{ print $cmd " " $1 }\''

  $run_test = "${script} | grep passwd "
  $run_script = "${script} | sh "

  exec { "password_policy_enforcement":
    command => $run_script,
    onlyif  => $run_test,
    path    => ['/usr/bin','/bin','/usr/sbin','/sbin'],
  }

}
