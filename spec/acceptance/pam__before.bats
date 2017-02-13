@test "testcase installed" {
  grep 'pam_rhosts_auth.so.1' /etc/pam.conf
}
