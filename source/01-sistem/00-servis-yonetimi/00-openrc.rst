OpenRC
======
Türkmen varsayılan olarak **openrc** kullanır.

Kurulum
^^^^^^^
ymp kullanarak openrc yüklemek için aşağıdaki komutu kullanabilirsiniz:

.. code-block:: shell

	$ ymp install openrc

Kaynak koddan derlemek için aşağıdaki adımları izlemelisiniz:

.. code-block:: shell

	$ git clone https://github.com/OpenRC/openrc
	$ cd openrc
	$ meson setup build --prefix=/usr
	$ ninja -C build install

Basit kullanım
^^^^^^^^^^^^^^
Servis etkinleştirip devre dışı hale getirmek için **rc-update** komutu kullanılır.

.. code-block:: shell

	# servis etkinleştirmek için
	$ rc-update add udhcpc boot
	# servisi devre dışı yapmak için
	$ rc-update del udhcpc boot
	# Burada udhcpc servis adı boot ise runlevel adıdır.

Servisleri başlatıp durdurmak için ise **rc-service** komutu kullanılır.

.. code-block:: shell

	$ rc-service udhcpc start
	# veya şu şekilde de çalıştırılabilir.
	$ /etc/init.d/udhcpc start

Servislerin durmunu öğrenmek için **rc-status** komutu kullanılır.

.. code-block:: shell

	$ rc-status

Sistemi kapatmak / yeniden başlatmak için **openrc-shutdown** komutunu kullanabilirsiniz.

.. code-block:: shell

	# kapatmak için
	$ openrc-shutdown -p 0
	# yeniden başlatmak için
	$ openrc-shutdown -r 0

Docker içinde servis çalıştırma
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Docker veya farklı bir ortamda sistem başlatılmadığı için servisler normal olarak çalıştırılmayacaktır. Fakat aşağıdaki adımları uygulayarak servis başlatmamız mümkündür.

.. code-block:: shell

	# Önce /run/openrc dizini oluşturulur
	$ mkdir -p /run/openrc
	# Ardından boş softlevel dosyası oluşturulur
	$ touch /run/openrc/softlevel

Bu işlemden sonra servis başlatmamız mümkün hale gelmektedir. Servisi aşağıdaki komut ile başlatabiliriz.

.. code-block:: shell

	$ rc-service sshd start


