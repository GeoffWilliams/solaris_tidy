@test "timeout fixed" {
  grep '\*timeout:.*0:10:00' /usr/openwin/lib/app-defaults/XScreenSaver
}

@test "lockTimeout fixed" {
  grep '\*lockTimeout:.*0:00:00' /usr/openwin/lib/app-defaults/XScreenSaver
}

@test "lock fixed" {
  grep '\*lock:.*True' /usr/openwin/lib/app-defaults/XScreenSaver
}
