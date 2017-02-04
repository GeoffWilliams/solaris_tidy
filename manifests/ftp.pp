# Solaris_tidy::Ftp
#
# Ensure that a minimal set of dangerous users are always prevented from using
# ftp
class solaris_tidy::ftp(
    $banner = "Authorized uses only. All activity may be monitored and reported",
) {

  #
  # disable bad users
  #
  $bad_users = [
    "adm",
    "bin",
    "daemon",
    "gdm",
    "listen",
    "lp",
    "noaccess",
    "nobody",
    "nobody4",
    "nuucp",
    "postgres",
    "root",
    "smmsp",
    "svctag",
    "sys",
    "uucp",
    "webservd",
  ]

  $ftpusers = "/etc/ftpd/ftpusers"

  file { $ftpusers:
    ensure => file,
    owner  => "root",
    group  => "sys",
    mode   => "0644",
  }

  $bad_users.each |$bad_user| {
    file_line {"ftpuser ${bad_user}":
      ensure => present,
      path   => $ftpusers,
      line   => $bad_user,
    }
  }

  #
  # enable FTP logging
  #
  # inetadm -m svc:/network/ftp \
  #exec="/usr/sbin/in.ftpd -a -l -d"




  #
  # FTP Warning banner
  #

  file { "/etc/ftpd/banner.msg":
    ensure  => file,
    owner   => "root",
    group   => "root",
    mode    => "0444",
    content => $banner,
  }
}
