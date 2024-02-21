.. _elogind:
Elogind
=======
**elogind** systemd projesinde bulunan **logind** uygulamasının systemd'den bağımsız çalışabilen halidir.
Genellikle systemd'i kullanmayan ancak KDE veya GNOME gibi systemd'e bağımlı yazılımları kullanmak isteyen kullanıcılar için tercih edilir.
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

Kullanım
^^^^^^^^
**loginctl** komutu, oturum yöneticisini denetlemek ve analiz etmek için kullanılır.
Örneğin, sistemi kapatmak veya yeniden başlatmak için şu komutları kullanabilirsiniz:

.. code-block:: shell

	loginctl poweroff
	loginctl reboot

Uyku moduna almak için ise şu komutları kullanabilirsiniz:

.. code-block:: shell

	loginctl suspend

**Not:** Uyku modu bazı donanımlarda düzgün çalışmayabilir.


Oturum kontrolü
+++++++++++++++
**loginctl** komutu, Linux sistemlerinde oturumları kontrol etmek ve yönetmek için kullanılır.
Bu komut, kullanıcıların oturumlarını listeleme, oturumları kapatma, ekranları kilitleme, sistem işlemlerini gerçekleştirme gibi çeşitli işlemleri gerçekleştirmek için kullanılır.

Oturumları Listeleme:

.. code-block:: shell

	loginctl list-sessions

Bu komut, sistemdeki tüm oturumları listeler. Her oturumun bir oturum kimliği (session id) bulunur.

Oturumu Kapatma:

.. code-block:: shell

	loginctl terminate-session <session-id>

Bu komut, belirtilen oturumu sonlandırır. <session-id>, sonlandırmak istediğiniz oturumun kimliğidir.

Ekranı Kilitleme:

.. code-block:: shell

	loginctl lock-session <session-id>

Bu komut, belirtilen oturumun ekranını kilitlemeye yarar. <session-id>, kilitlemek istediğiniz oturumun kimliğidir.

Ekran Kilidini Açma:

.. code-block:: shell

	loginctl unlock-session <session-id>

Bu komut, belirtilen oturumun ekranının kilidini açar. <session-id>, kilidini açmak istediğiniz oturumun kimliğidir.


