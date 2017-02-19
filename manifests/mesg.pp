# Aix_tidy::Mesg
#
# Set `mesg n`
class solaris_tidy::mesg {
  file_line { "/etc/profile mesg":
    ensure => present,
    line   => "mesg n",
    match  => "^mesg",
    path   => "/etc/profile",
  }

  file_line { "/etc/.login mesg":
    ensure => present,
    line   => "mesg n",
    match  => "^mesg",
    path   => "/etc/.login",
  }
}
