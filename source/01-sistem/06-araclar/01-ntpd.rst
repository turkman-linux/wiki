ntpd
====
Sistem saatini bir sunucudan bakarak eşlemeye yarayan araçtır.
**busybox** tarafından sağlanabilir.

.. code-block:: shell

	BusyBox v1.36.1 (2023-06-09 19:35:59 UTC) multi-call binary.

	Usage: ntpd [-dnqNwl] [-I IFACE] [-S PROG] [-k KEYFILE] [-p [keyno:N:]PEER]...

	NTP client/server

	        -d[d]   Verbose
	        -n      Run in foreground
	        -q      Quit after clock is set
	        -N      Run at high priority
	        -w      Do not set time (only query peers), implies -n
	        -S PROG Run PROG after stepping time, stratum change, and every 11 min
	        -k FILE Key file (ntp.keys compatible)
	        -p [keyno:NUM:]PEER
	                Obtain time from PEER (may be repeated)
	                Use key NUM for authentication
	                If -p is not given, 'server HOST' lines
	                from /etc/ntp.conf are used
	        -l      Also run as server on port 123
	        -I IFACE Bind server to IFACE, implies -l

Servisin başlatılması
^^^^^^^^^^^^^^^^^^^^^
Servisi elle başlatmak için `busybox ntpd` komutunu kullanabiliriz.

.. code-block:: shell

	$ busybox ntpd

Openrc servisi kullanarak da başlatabiliriz. Bunun için ağağıdaki gibi servis dosyası yazalım.

.. code-block:: shell


	#!/sbin/openrc-run

	description="Network Time Sync"

	name="busybox ntpd"
	command="/bin/busybox"
	command_args="ntpd -n"
	pidfile="/run/syslogd.pid"
	command_background=true

	depend() {
	      need net
	      provide timesync
	}
Bu servis dosyasını **/etc/init.d/ntpd** dosyasına kaydettikten sonra aşağıdaki komutla etkinleştirelim.

.. code-block:: shell

	# etkinleştirelim
	$ rc-update add ntpd
	# başlatalım
	$ rc-service ntpd start

Yapılandırma dosyası
^^^^^^^^^^^^^^^^^^^^
Yapılandırma dosyası **/etc.ntp.conf** konumundadır. Örnek yapılandırma aşağıdaki gibidir.

.. code-block:: shell

	server 0.pool.ntp.org
	server 1.pool.ntp.org
	server 2.pool.ntp.org


