# Solaris_tidy::Permissions
#
# Common permissions on Solaris
class solaris_tidy::permissions {
  file { "/var/tmp":
    ensure => directory,
    owner  => "root",
    group  => "sys",
    mode   => "1777",
  }

  file { "/etc":
    ensure => directory,
    owner  => "root",
    group  => "sys",
    mode   => "0755",
  }

  file { "/var":
    ensure => directory,
    owner  => "root",
    group  => "sys",
    mode   => "0755"
  }

  file { "/var/spool":
    ensure => directory,
    owner  => "root",
    group  => "bin",
    mode   => "0755",
  }

  file { "/etc/security":
    ensure => directory,
    owner  => "root",
    group  => "sys",
    mode   => "0750",
  }

  file { "/var/adm/messages":
    ensure => file,
    owner  => "root",
    group  => "root",
    mode   => "0600",
  }

  file { "/var/log/syslog":
    ensure => file,
    owner  => "root",
    group  => "sys",
    mode   => "0644",
  }
}
