Docker Kurulumu
===============
Ymp kullanarak docker yüklemek için aşağıdaki komutu kullanabilirsiniz.

.. code-block:: shell

	$ ymp install docker

Kaynak koddan yüklemek için sırası ile şunları derleyin

.. code-block:: shell

	https://github.com/krallin/tini
	https://github.com/opencontainers/runc
	https://github.com/containerd/containerd
	https://github.com/moby/moby
	https://github.com/docker/cli/

Daha sonra container içerisinde ağ bağlantısını yönlendirebilmemiz için aşağıdaki eklemeyi yapmamız gereklidir.

.. code-block:: shell

	# sysctl.conf dosyasına ekleme yapalım
	echo "net.ipv4.ip_forward = 1" > /etc/sysctl.conf
	sysctl -p /etc/sysctl.conf
	# Veya kernel üzerinden etkinleştirelim (Bunu her açılışta yapmamız gerekir)
	echo 1 > /proc/sys/net/ipv4/ip_forward

Servisin başlatılması
^^^^^^^^^^^^^^^^^^^^^
Openrc servisini başlatmak için aşağıdaki komutu kullanabiliriz.

.. code-block:: shell

	# servisi aşılışa eklemek için
	$ rc-update add docker
	# servisi çalıştırmak için
	$ rc-service docker start

Servisi elle başlatmak için ise aşağıdaki gibi bir yol izlenebilir.

.. code-block:: shell

	$ containerd &
	$ dockerd &

