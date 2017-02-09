# Solaris_tidy::Cron
#
# Manage common cron settings and permissions
class solaris_tidy::cron(
    $allow_users = ['root']
) {
  class {"cron::cron_allow_deny":
    allow_users => ['root'],
  }

  include cron::protect_log
  include cron::protect_var

  # enable cron logging
  file_line { "/etc/default/cron CRONLOG=YES":
    ensure => present,
    path   => "/etc/default/cron",
    line   => "CRONLOG=YES",
    match  => "CRONLOG=",
  }

}
