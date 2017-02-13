# Solaris_tidy::Logging
#
# Configuring logging options for solaris:
# * Enable inetd connection logging
# * Enable FTP debug logging
# * Enable daemon debug logging
# * Capture syslog auth messages
# * Enable login records
# * Capture all failed login attempts
# * Enable system accounting (sar)
# * Permissions on /var/adm/sa
# * sa1 and sa2 cronjobs
class solaris_tidy::logging {
  $logadm_conf = "/etc/logadm.conf"

  # Enable inetd Connection Logging
  # refresh permormed inline to avoid accidentally starting inet if it was
  # disabled.
  exec { "inetadm tcp_trace":
    command => "inetadm -M tcp_trace=true && svcadm refresh svc:/network/inetd",
    unless  => "inetadm -p |grep tcp_trace=TRUE",
    path    => ['/bin','/usr/bin','/sbin','/usr/sbin'],
  }

  service { "svc:/system/system-log":
    ensure => running,
    enable => true,
  }

  # Enable FTP debug logging
  $ftp_exec = 'exec="/usr/sbin/in.ftpd -a -l -d"'
  exec { "inetadm svc:/network/ftp exec":
    command => "inetadm -m svc:/network/ftp ${ftp_exec}",
    unless  => "inetadm -l svc:/network/ftp |grep \"${ftp_exec}\"",
    path    => ['/bin','/usr/bin','/sbin','/usr/sbin'],
  }

  # Enable Debug Level Daemon Logging
  $connlog_file = "/var/log/connlog"
  file { $connlog_file:
    ensure => file,
    owner  => "root",
    group  => "root",
    mode   => "0600",
  }

  file_line { "/etc/syslog.conf daemon.debug":
    ensure  => present,
    path    => "/etc/syslog.conf",
    line    => "daemon.debug\t\t\t${connlog_file}",
    match   => "^daemon.debug",
    require => File[$connlog_file],
    notify  => Service["svc:/system/system-log"],
  }

  # write an entry to /etc/logadm.conf for log rotation
  file_line { "/etc/logadm.conf connlog":
    ensure => present,
    path   => $logadm_conf,
    match  => "^connlog",
    line   => "connlog -C 13 -a 'pkill -HUP syslogd' /var/log/authlog",
  }

  # Capture syslog AUTH Messages
  $authlog_file = "/var/log/authlog"

  file { $authlog_file:
    ensure => file,
    owner  => "root",
    group  => "sys",
    mode   => "0600",
  }

  file_line { "/etc/syslog.conf auth.info":
    ensure  => present,
    path    => "/etc/syslog.conf",
    line    => "auth.info\t\t\t${authlog_file}",
    match   => "^auth.info",
    require => File[$authlog_file],
    notify  => Service["svc:/system/system-log"],
  }

  # Enable Login Records
  $loginlog_file = "/var/adm/loginlog"
  file { $loginlog_file:
    ensure => file,
    owner  => "root",
    group  => "sys",
    mode   => "0600",
  }

  # write an entry to /etc/logadm.conf for log rotation
  file_line { "/etc/logadm.conf loginlog":
    ensure => present,
    path   => $logadm_conf,
    match  => "^loginlog",
    line   => "loginlog -C 13 /var/adm/loginlog",
  }

  # Capture All Failed Login Attempts
  # SYSLOG_FAILED_LOGINS=0 means start logging failures after zero attempts (log
  # all failures)
  file_line { "/etc/default/login SYSLOG_FAILED_LOGINS":
    ensure => present,
    match  => "^SYSLOG_FAILED_LOGINS=",
    line   => "SYSLOG_FAILED_LOGINS=0",
    path   => "/etc/default/login"
  }

  # Enable System Accounting
  service { "svc:/system/sar":
    ensure => running,
    enable => true,
  }

  cron { 'sa1':
    command  => '/usr/lib/sa/sa1',
    user     => 'sys',
    minute   => ["0", "20", "40"],
    hour     => "*",
    month    => "*",
    monthday => "*",
    weekday  => "*",
  }

  cron { 'sa2':
    command  => '/usr/lib/sa/sa2 -s 0:00 -e 23:59 -i 1200 -A',
    user     => 'sys',
    minute   => ["45", "23"],
    hour     => "*",
    month    => "*",
    monthday => "*",
    weekday  => "*",
  }

  chown_r { "/var/adm/sa/":
    want_user  => "sys",
    want_group => "sys",
  }

  chmod_r { "/var/adm/sa/":
    want_mode => "0644",
  }

  # TODO Enable Kernel Level Auditing
}
