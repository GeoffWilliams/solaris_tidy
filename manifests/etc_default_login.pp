# Solaris_tidy::Etc_default_login
#
# Entries for /etc/default/login
#
# @param retries How many login retries to allow
class solaris_tidy::etc_default_login(
    $retries = 3
) {

  # Restrict root Login to System Console
  file_line { "/etc/default/login CONSOLE":
    ensure => present,
    path   => "/etc/default/login",
    line   => "CONSOLE=/dev/console",
    match  => "^CONSOLE="
  }

  # limit retries
  file_line { "/etc/default/login RETRIES":
    ensure => present,
    path   => "/etc/default/login",
    line   => "RETRIES=${retries}",
    match  => "^RETRIES="
  }
}
