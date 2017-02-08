# BATS test file to run after executing 'examples/init.pp' with puppet.
#
# For more info on BATS see https://github.com/sstephenson/bats

# Tests are really easy! just the exit status of running a command...
@test "shell disabled by puppet" {
  ! grep '^shell' /etc/inet/inetd.conf
}

@test "login disabled by puppet" {
  ! grep '^login' /etc/inet/inetd.conf
}

@test "exec disabled by puppet" {
  ! grep '^exec' /etc/inet/inetd.conf
}

@test "rexd disabled by puppet" {
  ! grep '^rexd' /etc/inet/inetd.conf
}

@test "walld disabled by puppet" {
  ! grep '^walld' /etc/inet/inetd.conf
}

@test "jboss enabled (not touched by puppet)" {
  grep '^jboss' /etc/inet/inetd.conf
}
