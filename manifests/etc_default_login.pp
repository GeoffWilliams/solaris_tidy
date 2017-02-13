# Solaris_tidy::Etc_default_login
#
# Entries for /etc/default/login
#
# @param retries How many login retries to allow
class solaris_tidy::etc_default_login(
    $retries = "3",
    $umask   = "077",
) {

  Shellvar {
    ensure => present,
    target => "/etc/default/login",
  }

  # Restrict root Login to System Console
  shellvar { "/etc/default/login CONSOLE":
    variable => "CONSOLE",
    value    => "/dev/console",
  }

  # limit retries
  shellvar { "/etc/default/login RETRIES":
    variable => "RETRIES",
    value    => $retries,
  }

  shellvar { "/etc/default/login UMASK":
    variable => "UMASK",
    value    => $umask,
  }

}
