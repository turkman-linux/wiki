Hyprland
====
Hyprland wayland pencere yöneticisidir. Animasyonlara sahip olup düşük kaynak kullanımını hedefler.

.. image:: /_static/images/hyprland-desktop.png
  :width: 400

Yükleme
^^^^^^^
Ymp kullanarak sway yüklemek için **hyprland** paketini yüklemelisiniz.

Ardından **seatd** ve **devfs** servislerini etkinleştirmelisiniz.

.. code-block:: shell

	# paketi kuralım
	$ ymp install sway
	# servisleri etkinleştirmek için
	$ rc-update add seatd
	$ rc-update add devfs
	# servisleri açmak için
	$ rc-service devfs start
	$ rc-service seatd start

Çalıştırma
^^^^^^^^^^
Çalıştırmak için tty ekranındayken eğer **hyprland** servisi açıksa doğrudan **hyprland** komutu ile oturum açabilirsiniz.
Service açmadıysanız **seatd-launch hyprland** komutu kullanabilirsiniz.

Kullanımı
^^^^^^^^^
Temel kısayollar aşağıdaki gibi sıralanabilir:

* `super + q` = yeni terminal aç
* `super + e` = yeni dosya yöneticisi aç
* `super + ok tuşu` = pencereler arası geçiş
* `super + [1-9]` = masaüstüne geç
* `super + j` = pencereleri dik/yan konumlandır.
* `super + shift + [1-9]` = pencereyi masaüstüne taşı ve o masaüstüne geç
* `super + c` = pencereyi kapat
* `super + m` = hyprland ortamını kapat

Ekran görüntüsü alma
^^^^^^^^^^^^^^^^^^^^
**grim** kullanarak ekran görüntüsü alabilirsiniz.

.. code-block:: shell

	# tüm ekranın görüntüsünü almak için
	$ grim -o output.png

Ekranın bir bölümünü almak isterseniz **slurp** komutu ile birlikte kullanabilirsiniz.

.. code-blck:: shell

	# ekranın bir bölümünü almak için
	$ slurp | grim -g -

Yapılandırma
^^^^^^^^^^^^
Bununla birlikte **~/.config/hyprland/hyprland.conf** dosyasından kendi kullanıcınıza özel ayarlama yapabilirsiniz.

