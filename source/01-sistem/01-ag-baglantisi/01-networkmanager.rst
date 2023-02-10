NetworkManager
==============
**networkmanager** paketi tarafından sağlanan ağ yönetim uygulamasıdır.

Kurulumu
^^^^^^^^
ymp ile kurmak için aşağıdaki komutu kullanabilirsiniz.

.. code-block:: shell

	$ ymp install networkmanager

Kaynak koddan derlemek için aşağıdaki işlemleri uygulayabilirsiniz.

.. code-block:: shell

	# Tüm seçenekler için meson_options.txt dosyasına bakın
	$ meson setup build \
	    -Dsystemd_journal=false \
	    -Dsystemdsystemunitdir=no \
	    -Dsession_tracking=no \
	    -Dsession_tracking_consolekit=false ...
	$ ninja -C build
	$ ninja -C build install

Openrc servisi
^^^^^^^^^^^^^^
Turkman networkmanager için openrc servisi sağlar.
Bu sayede ağ bağlantısı sistem açıldığında otomatik olarak yapılmış olur.
Servisi aşağıdaki gibi etkinleştirebiliriz.

.. code-block:: shell

	$ rc-update add networkmanager

Servisi elle başlatma
^^^^^^^^^^^^^^^^^^^^^
**NetworkManager** komutu kullanılarak servis elle başlatılabilir.
Bunun için önce **dbus** etkinleştirilmelidir.
Eğer **-d** parametresi ile başlatırsanız servis hata ayıklama modunda başlatılacaktır.

.. code-block:: shell

	# dbus servisini açmak için
	$ rc-service dbus start
	# openrc kullanmadan çalıştırabiliriz.
	$ mkdir -p /var/run/dbus
	$ dbus-daemon --system &
	# servisi başlatma
	$ NetworkManager


