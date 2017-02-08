# BATS test file to run before executing 'examples/init.pp' with puppet.
#
# For more info on BATS see https://github.com/sstephenson/bats

@test "shell enabled" {
  grep '^shell' /etc/inet/inetd.conf
}

@test "login enabled" {
  grep '^login' /etc/inet/inetd.conf
}

@test "exec enabled" {
  grep '^exec' /etc/inet/inetd.conf
}

@test "rexd enabled" {
  grep '^rexd' /etc/inet/inetd.conf
}

@test "walld enabled" {
  grep '^walld' /etc/inet/inetd.conf
}

@test "jboss enabled" {
  grep '^jboss' /etc/inet/inetd.conf
}
