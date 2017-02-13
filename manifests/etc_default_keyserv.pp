# Solaris_tidy::Etc_default_keyserv
#
# Disable 'nobody' keys in /etc/default/keyserv
class solaris_tidy::etc_default_keyserv {

  shellvar { "/etc/default/keyserv ENABLE_NOBODY_KEYS":
    ensure   => present,
    variable => "ENABLE_NOBODY_KEYS",
    target   => "/etc/default/keyserv",
    value    => "NO",
  }

}
