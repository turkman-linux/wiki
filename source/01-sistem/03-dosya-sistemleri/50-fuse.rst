.. _fuse:
Fuse
====
Fuse kullanıcıların root erişimi olmadan disk bağlayabilmelerine imkan tanır.
Örneğin bir çıkarılabilir aygıt takıldığında içeriğine erişmek için fuse kullanılabilir.

Kurulumu
^^^^^^^^
Türkmen linuxta fuse yüklemek için aşağıdaki komutu kullanabilirsiniz.

.. code-block:: shell

	$ ymp install fuse
	# Eğer libfuse2 gerektiren bir uygulama çalıştıracaksanız şunu da yüklemelisiniz.
	$ ymp install fuse2

Daha sonra fuse servisini çalıştıralım.

.. code-block:: shell

	# Açılışa ekleyelim
	$ rc-update add fuse
	# Çalıştıralım
	$ rc-service fuse start

Eğer servis yerine elle başlatmak isterseniz aşağıdaki gibi çalıştırabilirsiniz.

.. code-block:: shell

	# Önce modülü yükleyelim.
	$ modprobe fuse
	# Şimdi connections kısmını bağlayalım.
	$ mount -t fusectl none /sys/fs/fuse/connections

Son olarak fusermount komutuna suid biti ayarlayalım.

.. code-block:: shell

	$ chmod u+s /usr/bin/fusermount

