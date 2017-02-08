# Solaris_tidy::Stack_protection
#
# Configure stack protection
class solaris_tidy::stack_protection {
# # if [ ! "`grep noexec_user_stack=
# /etc/system`"]; then cat
# <<END_CFG >>/etc/system * Attempt to
# prevent and log stack-smashing
# attacks set noexec_user_stack=1 set
# noexec_user_stack_log=1 END_CFG fi
}
