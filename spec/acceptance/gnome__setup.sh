mkdir -p /usr/openwin/lib/app-defaults/
mkdir -p /etc/X11/gdm/
cat > /usr/openwin/lib/app-defaults/XScreenSaver <<'END'
! To show the time only:
! For 24 hour time:
*Dialog.headingFont:            *-times-bold-r-*-*-*-180-*-*-*-iso8859-1
*timeoutLabel.labelString:      Saver Timeout
*timeout:               0:15:00
*lockTimeout:           0:05:00
*lock:                  False
END
