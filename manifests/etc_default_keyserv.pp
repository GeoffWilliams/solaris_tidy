# Solaris_tidy::Etc_default_keyserv
#
# Disable 'nobody' keys in /etc/default/keyserv
class solaris_tidy::etc_default_keyserv {

  file_line { "/etc/default/keyserv":
    ensure => present,
    path   => "/etc/default/keyserv",
    line   => "ENABLE_NOBODY_KEYS=NO",
    match  => "^ENABLE_NOBODY_KEYS=",
  }

}
