Bubblewrap
==========
Bubblewrap root yetkisine ihtiyaç duymadan uygulamaları kısıtlı alanda çalıştırabilmemize yarayan bir araçtır.

Türkmen linuxa yüklemek için aşağıdaki komutu kullanabilirsiniz:

.. code-block:: shell

	$ ymp install bubblewrap

Kullanımı
+++++++++
Bubblewrap **bwrap** komutu ile kullanılır. Bu komut aldığı parametrelere göre kısıtlı alanınızı oluşturur.
Oluşturulan kısıtlı alanda girmiş olduğunuz komut çalıştırılır. Örneğin:

.. code-block:: shell

	$ bwrap --ro-bind / / \
	    --bind $HOME $HOME \
	    --tmpfs $HOME/gecici
	    --dev /dev \
	    --proc /proc \
	    --bind /sys /sys \
	    --setenv HOME $HOME/gecici \
	    --hostname sandbox \
	    -- /bin/bash -i 

Yukarıdaki komut ile:

* kök dizin yazılamaz bağlandı

* ev dizin yazılabilir bağlandı

* /dev /sys /proc dizinleri bağlanı

* ev dizini değişkeni ayarlandı

* hostname ayarlandı

* parametre algılama sonlandırıldı.

* /bin/bash çalıştırıldı.

Başka dağıtım ile kullanma
++++++++++++++++++++++++++
Bwrap kullanarak başka bir linux dağıtımını uygulama çalıştırmak için kullanabiliriz. Bu dokümanda örnek olarak alpine linux üzerinden anlatılacaktır.

İlk olarak rootfs imajını edinelim. Alpine linux için: https://www.alpinelinux.org/downloads/ adresinden minimal rootfs olanı indirin.

Ardından dosyaları bir dizine çıkarın. Bu aşamada root yetkisi kullanmayacağımız için dosya izinlerinin kendi kullanıcınıza ait olması gerekir.

.. code-block:: shell

	$ mkdir alpine
	$ cd alpine
	$ tar -xf alpine-minirootfs-3.22.2-x86_64.tar.gz
	$ cd ..

Son olarak içerisine girmek için aşağıdaki gibi bir komut kullanalım. Bu komutu daha sonra kullanmak için bir dosyaya kaydedebilirsiniz.

.. code-block:: shell

	# dbus session bus dizinini bulalım
	$ dbus_dir=$(echo $DBUS_SESSION_BUS_ADDRESS | cut -f2 -d"=" | cut -f1 -d",")
	# shell çalıştıralım
	$ bwrap --bind ./alpine / \
	    --dev /dev \
	    --proc /proc \
	    --bind /sys /sys \
	    --dev-bind /dev/dri /dev/dri \
	    --tmpfs /tmp \
	    --setenv PS1 "\$ (alpine) " \
	    --ro-bind / /system \
	    --bind /tmp/.X11-unix /tmp/.X11-unix \
	    --bind $XDG_RUNTIME_DIR $XDG_RUNTIME_DIR \
	    --bind $dbus_dir $dbus_dir \
	    --bind $HOME $HOME \
	    -- /bin/ash -i

Ardından paket sistemini kullanarak içerisine istediğiniz uygulamayı yükleyebilirsiniz ve çalıştırabilirsiniz. Örneğin:

.. code-block:: shell

	$ (alpine) apk add chromium font-dejavu
	$ (alpine) chromium

**Not:** Bu şekilde kullandığınız dağıtım root yetkisi yerine sizin kullanıcınızda çalışacaktır ve bu durum bazı öngörülemez hatalara sebep olabilir.


Tek kullanımlık ev dizini
+++++++++++++++++++++++++
bwrap kullanarak tek kullanımlık ev dizini oluşturabilir ve uygulamalarınızı boş ortamda deneyebilirsiniz.

.. code-block:: shell

	$ bwrap --ro-bind / / \
	    --dev /dev \
	    --proc /proc \
	    --bind /sys /sys \
	    --bind /tmp /tmp \
	    --bind /run /run \
	    --tmpfs $HOME \
	    -- /usr/bin/firefox
