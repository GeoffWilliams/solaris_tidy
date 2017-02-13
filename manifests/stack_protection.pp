# Solaris_tidy::Stack_protection
#
# Configure stack protection
class solaris_tidy::stack_protection {
  file_line { "/etc/system noexec_user_stack":
    ensure => present,
    path   => "/etc/system",
    line   => "set noexec_user_stack=1",
    match  => "set\s+noexec_user_stack=",
  }

  file_line { "/etc/system noexec_user_stack_log":
    ensure => present,
    path   => "/etc/system",
    line   => "set noexec_user_stack_log=1",
    match  => "set\s+noexec_user_stack_log=",
  }
}
