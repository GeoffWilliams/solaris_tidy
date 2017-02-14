mkdir -p /usr/openwin/lib/app-defaults/
mkdir -p /etc/X11/gdm/
cat > /usr/openwin/lib/app-defaults/XScreenSaver <<'END'
# Have fun! - George

[daemon]
# Automatic login, if true the first local screen will automatically logged
# in as user as set with AutomaticLogin key.
AutomaticLoginEnable=false
AutomaticLogin=

# Timed login, useful for kiosks.  Log in a certain user after a certain
# amount of time
TimedLoginEnable=false
TimedLogin=
TimedLoginDelay=30

# The gdm configuration program that is run from the login screen, you should
# probably leave this alone
#Configurator=/usr/bin/gdmsetup --disable-sound --disable-crash-dialog
[greeter]
#Welcome=hello
END
