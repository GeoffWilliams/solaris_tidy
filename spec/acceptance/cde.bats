@test "C system resources created" {
  test -f /etc/dt/config/C/sys.resources
}

@test "DE system resources created" {
  test -f /etc/dt/config/DE/sys.resources
}

@test "C system resources saverTimeout populated" {
  grep 'dtsession\*saverTimeout' /etc/dt/config/C/sys.resources
}

@test "DE system resources saverTimeout populated" {
  grep 'dtsession\*saverTimeout'  /etc/dt/config/DE/sys.resources
}

@test "C system resources lockTimeout populated" {
  grep 'dtsession\*lockTimeout' /etc/dt/config/C/sys.resources
}

@test "DE system resources lockTimeout populated" {
  grep 'dtsession\*lockTimeout'  /etc/dt/config/DE/sys.resources
}

@test "C system resources permissions correct" {
  [[ $(stat -c %a /etc/dt/config/C/sys.resources) == "444" ]]
}

@test "DE system resources permissions correct" {
  [[ $(stat -c %a /etc/dt/config/DE/sys.resources) == "444" ]]
}

@test "C system resources user correct" {
  [[ $(stat -c %U /etc/dt/config/C/sys.resources) == "root" ]]
}

@test "DE system resources user correct" {
  [[ $(stat -c %U /etc/dt/config/DE/sys.resources) == "root" ]]
}

@test "C system resources group correct" {
  [[ $(stat -c %G /etc/dt/config/C/sys.resources) == "sys" ]]
}

@test "DE system resources group correct" {
  [[ $(stat -c %G /etc/dt/config/DE/sys.resources) == "sys" ]]
}

@test "C system resources labelString populated" {
  grep 'Dtlogin\*greeting.labelString' /etc/dt/config/C/Xresources
}

@test "DE system resources persLabelString populated" {
  grep 'Dtlogin\*greeting.persLabelString'  /etc/dt/config/DE/Xresources
}

@test 'double check value propagated' {
  grep 'lawn'  /etc/dt/config/DE/Xresources
}
