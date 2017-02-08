# Solaris_tidy::Permissions
#
# Common permissions on Solaris
class solaris_tidy::permissions {
  file { "/var/tmp":
    ensure => directory,
    mode   => "1777",
  }

  file { "/etc":
    ensure => directory,
    mode   => "0755",
  }

  file { "/var":
    ensure => directory,
    mode   => "0755"
  }

  file { "/var/spool":
    ensure => directory,
    mode   => "0755",
  }

  file { "/etc/security":
    ensure => directory,
    mode   => "0750",
  }

  file { "/var/adm/messages":
    ensure => directory,
    mode   => "0600",
  }
}
