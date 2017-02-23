# Solaris_tidy::Etc_security_policy
#
# flags in /etc/security/policy
class solaris_tidy::etc_security_policy {

  # Set Retry Limit for Account Lockout

  # The target file seems to follow the solaris trick of using a file that looks
  # like simple shell variables but actually isn't.  In a stock opensolaris
  # /etc/secuirty/policy.conf file there is a line where a variable is assigned
  # that contains spaces and is not quoted:
  #   PROFS_GRANTED=Basic Solaris User
  # this is an error in SH and results in a variable PROFS_GRANTED containing
  # 'Basic' followed by an attempt to execute the commands 'Solaris' and 'User'.
  # This also causes the shellvar augeas type (correctly) to fail with an error
  # about the lens not matching.  For simplicity, rewrite this change to use a
  # file_line resource
  file_line { "/etc/security/policy.conf LOCK_AFTER_RETRIES":
    ensure => present,
    line   => "LOCK_AFTER_RETRIES=YES",
    path   => "/etc/security/policy.conf",
    match  => "^LOCK_AFTER_RETRIES=",
  }

}
