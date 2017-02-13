# Solaris_tidy::Etc_security_policy
#
# flags in /etc/security/policy
class solaris_tidy::etc_security_policy {

  # Set Retry Limit for Account Lockout
  shellvar { "/etc/security/policy.conf LOCK_AFTER_RETRIES":
    ensure   => present,
    variable => "LOCK_AFTER_RETRIES",
    target   => "/etc/security/policy.conf ",
    value    => "YES",
  }

}
