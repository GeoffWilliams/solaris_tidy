# Solaris_tidy::Etc_security_policy
#
# flags in /etc/security/policy
class solaris_tidy::etc_security_policy {

  # Set Retry Limit for Account Lockout
  file_line { "/etc/security/policy.conf LOCK_AFTER_RETRIES":
    ensure => present,
    path   => "/etc/security/policy.conf ",
    line   => "LOCK_AFTER_RETRIES=YES",
    match  => "^LOCK_AFTER_RETRIES=",
  }

}
