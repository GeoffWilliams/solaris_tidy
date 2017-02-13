# Solaris_tidy::Pam
#
# comment out lines containing rhosts
class solaris_tidy::pam {

  comment_line { "/etc/pam.conf disable rhosts":
    path  => "/etc/pam.conf",
    match => "pam_rhosts_auth",
  }
}
