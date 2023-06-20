syslog
======
Syslog çalışan sistem servislerinin loglarını tutar. 
Bu loglar /var/log/messages içerisinde bulunur. Bu sayede sistemle ilgili tüm logları buradan takip edebilirsiniz.

.. code-block:: shell

	# logları takip etmek için aşağıdaki komut kullanılabilir.
	$ tail -f /var/log/messages


Servisin başlatılması
^^^^^^^^^^^^^^^^^^^^^
**syslogd** komutunu kullanarak servisi başlatabilirsiniz. Bu komut busybox tarafından sağlanır.

.. code-block:: shell

	# komutla ilgili detaylara --help parametresi ile ulaşabilirsiniz.
	$ syslogd

Eğer isterseniz aşağıdaki gibi bir openrc servisi yazıp kullanabilirsiniz.

.. code-block:: shell

	#!/sbin/openrc-run

	description="Message logging system"

	name="busybox syslog"
	command="/bin/busybox"
	command_args="syslogd -n"
	pidfile="/run/syslogd.pid"
	command_background=true

	depend() {
	      need clock hostname localmount
	      provide logger
	}

Log yazma
^^^^^^^^^
*logger** komutunu kullanarak log yazdırabilirsiniz.

.. code-block:: shell

	$ logger "hello world"

bununla birlikte aşağıdaki C kodunu kullanarak log yazmak mümkündür.

.. code-block:: C

	#include <syslog.h>
	#include <unistd.h>
	int main(int argc, char** argv){
	    setlogmask (LOG_UPTO (LOG_NOTICE));
	    openlog ("test", LOG_CONS | LOG_PID | LOG_NDELAY, LOG_LOCAL1);
	    syslog (LOG_NOTICE, "Hello World from %d", getuid ());
	    closelog ();
	    return 0;
	}

Not: **/dev/log** konumundaki unix sockete bağlanıp log yollamayı oradan da yapabilirsiniz.

