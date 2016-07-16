These can all be dropped in /etc/systemd/systemd/ . To enable, run systemctl enable <something>.service as root. For the scripts which end with @, I have specific instructions:

* macspoof@.service - Taken from the ArchLinux wiki. Install like: systemctl enable macspoof@wlp3s0.service (where that name is your interface name). Will also need the macchanger command installed.
* screen-lock-suspend@.service - Install like: systemct enable screen-lock-suspend@normal.service (where that name is the username if will run for).
