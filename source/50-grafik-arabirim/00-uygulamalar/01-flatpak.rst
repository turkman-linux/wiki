Flatpak
=======
Flatpak sistemden bağımsız şekilde uygulama çalıştıran bir altyapıdır.
Bu sayede normal yolla kullanmak için çok fazla bağımlılığa ihtiyaç duyan veya kurulması mümkün olmayan uygulamalar çalıştırılabilir.

Kurulum
^^^^^^^
Öncelikle **flatpak** yükleyelim.

.. code-block:: shell

	$ ymp install build-base --no-emerge
	$ ymp install flatpak

Daha sonra gereken servisleri etkinleştirelim.

.. code-block:: shell

	$ rc-update add devfs
	$ rc-update add fuse
	$ rc-update add hostname

Depo ekleme
^^^^^^^^^^^
Flatpak için uygulama deposu eklememiz gereklidir. 
Flathub deposunu aşağıdaki gibi ekleyebilirsiniz.

.. code-block:: shell

	$ flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	# --user parametresi yetkili kullanıcı olmadan eklemek içindir.

İsterseniz aşağıdaki gibi alias tanımı yapıp sürekli kullanıcı modunda kullanabilirsiniz.

.. code-block:: shell

	alias flatpak=''flatpak --user


Uygulama yükleme
^^^^^^^^^^^^^^^^
**flatpak search** kullanarak uygulama arayabilirsiniz.
Yüklemek için **flatpak install** kaldırmak için ise **flatpak remove veya flatpak uninstall** komutları kullanılır.

**Not:** Yükleme ve kaldırma için **appid** değeri kullanılır.

.. code-block:: shell

	$ flatpak search  dolphin
	Name      Description               Application ID      Version   Branch Remotes
	Dolphin   File Manager              org.kde.dolphin     23.04.0   stable flathub
	...
	$ flatpak install org.kde.dolphin
	...
	$ flatpak remove org.kde.dolphin
	...

Uygulamaları güncelleme
^^^^^^^^^^^^^^^^^^^^^^^
**flatpak upgrade** komutu ile güncelleyebilirsiniz.

.. code-block:: shell

	$ flatpak upgrade

