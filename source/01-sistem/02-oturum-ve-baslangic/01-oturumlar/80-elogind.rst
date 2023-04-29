.. _elogind:
Elogind
=======
**elogind** systemd projesinde bulunan **logind** uygulamasının bağımsız çalışabilen halinin halidir.
Amacı kullanıcı oturumlarını yönetmektir. **Pam** kullanarak çalışır.

Kurulumu
^^^^^^^^
Ymp kullanarak aşağıdaki gibi kurulum yapabilirsiniz.

.. code-block:: shell

	$ ymp install elogind

Veya kaynak koddan derlemek için aşağıdaki komutları kullanabilirsiniz.

.. code-block:: shell

	# Seçenekler için meson_options.txt dosyasına bakın.
	$ meson setup build -Dpam=true ...
	$ ninja -C build
	$ ninja -C build install

Ardından openrc servisini etkinleştirelim. Bunun için aşağıdaki komuttan yararlanabiliriz.

.. code-block:: shell

	$ rc-update add elogind

elogind **pam** ile çalıştığı için pam yapılandırmasına eklememiz gerekmektedir.
Bunun için **/etc/pam.d/system-auth** dosyasına aşağıdaki satırı ekleyelim.

.. code-block:: txt

	# /etc/pam.d/system-auth dosyası içine en alta ekleyin.
	session    include    elogind-user

agetty servisinin ayar dosyasında **login** komutu ayarlamak gerekebilir.
Bunun sebebi **login** komutunun varsayılan olarak pam kullanmadan çalışan busybox tarafından sağlanmasıdır.
Bunun için **/etc/conf.d/agetty** içerisini aşağıdaki gibi değiştirelim.

.. code-block:: txt

	...
	agetty_options="-l /usr/bin/login"
	...

Oturumların listelenmesi
^^^^^^^^^^^^^^^^^^^^^^^^
Oturum listelemek için **loginctl** komutunu kullanabilirsiniz.
Bu komut aşağıdaki gibi çıktı verir.

.. code-block:: txt

	SESSION UID USER SEAT  TTY
	      1   0 root seat0 tty1
	
	1 sessions listed.


Oturumu kontrolü
^^^^^^^^^^^^^^^^
Oturumu kapatmak için:

.. code-block:: shell

	$ loginctl terminate-session <session-id>

Ekranı kilitlemek için:

.. code-block:: shell

	$ loginctl lock-session <session-id>

Sistem kontrolü
^^^^^^^^^^^^^^^
Sistemi kapatmak için:

.. code-block:: shell

	$ loginctl poweroff

Sistemi yeniden başlatmak için

.. code-block:: shell

	$ loginctl reboot

Sistemi uyku moduna almak için

.. code-block:: shell

	$ loginctl suspend

**Not:* Uyku modu bazı donanımlarda düzgün çalışmayabilir.
