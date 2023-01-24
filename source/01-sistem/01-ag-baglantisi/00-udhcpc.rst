udhcpc
======
Busybox tarafından sağlanan dhcp client uygulamasıdır.

Kullanımı aşağıdaki gibidir.

Öncelikle ağ arayüzünü etkinleştirelim.

.. code-block:: shell


	# burada eth0 ağ arayüzü adıdır.
	# ağ arayüzleri listesine /sys/class/net/ içerisinden ulaşabiliriniz.
	$ ip link set eth0 up

.. code-block:: shell

	# -s ile belirtilen betiğin varsayılan konumu /usr/share/udhcpc/default.script
	$ udhcpc -i eth0 -s udhcpc.sh

udhcpc çalışırken bir betiğe ihtiyaç duyar. Bu betik sayesinde ağ bağlantısı kurulur.

Betik içeriği aşağıdaki gibi olmalıdır.

.. code-block:: shell

	#!/bin/sh
	ip addr add $ip/$mask dev $interface
	if [ "$router" ] ; then
	  ip route add default via $router dev $interface
	fi

Burada değişkenler şu şekildedir.

* **$ip**: ip adresi
* **$mask**: netmask değeri
* **$interface**: ağ donanımı adı
* **$route**: route adresi (tanımlı olmayabilir)

OpenRC Servisi
^^^^^^^^^^^^^^^
Turkman udhcpc için openrc servisi sağlar. Bu servisini etkinleştirmek için aşağıdaki komutu kullanabilirsiniz. Bu sayede sistem açıldığında ağ bağlantınız udhcpc ile kurulmuş olur.

.. code-block:: shell

	rc-update add udhcpc boot
