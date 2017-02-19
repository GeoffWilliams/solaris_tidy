# Solaris_tidy::Etc_default_keyserv
#
# Disable 'nobody' keys in /etc/default/keyserv
class solaris_tidy::etc_default_keyserv {

  # Seems to crash if all lines commented for some reason... sigh... file_line
  # shellvar { "/etc/default/keyserv ENABLE_NOBODY_KEYS":
  #   ensure   => present,
  #   variable => "ENABLE_NOBODY_KEYS",
  #   target   => "/etc/default/keyserv",
  #   value    => "NO",
  # }
  file_line { "/etc/default/keyserv ENABLE_NOBODY_KEYS":
    ensure => present,
    line   => "ENABLE_NOBODY_KEYS=NO",
    path   => "/etc/default/keyserv",
    match  => "^ENABLE_NOBODY_KEYS",
  }
}
