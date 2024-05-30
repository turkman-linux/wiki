sway
====
Sway wayland pencere yöneticisidir. Sway X11 ortamındaki i3 pencere yöneticisinın benzeridir.

.. image:: /_static/images/sway-desktop.png
  :width: 400

Yükleme
^^^^^^^
Ymp kullanarak sway yüklemek için **sway** paketini yüklemelisiniz.

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
Çalıştırmak için tty ekranındayken eğer **seatd** servisi açıksa doğrudan **sway** komutu ile oturum açabilirsiniz.
Service açmadıysanız **seatd-launch sway** komutu kullanabilirsiniz.

Kullanımı
^^^^^^^^^
Temel kısayollar aşağıdaki gibi sıralanabilir:

* `super + enter` = yeni terminal aç
* `super + ok tuşu` = pencereler arası geçiş
* `super + shift + ok tuşu` = pencere konumunu ayarla
* `super + [1-9]` = masaüstüne geç
* `super + shift + [1-9]` = pencereyi masaüstüne taşı
* `super + Shift + Q` = pencereyi kapat
* `super + shift + E` = sway ortamını kapat

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

Kısa yol olarak yapılandırma dosyasına şunu ekleyebilirsiniz.

.. code-block:: shell

	# Prtsc tuşu ile parçalı ekran görüntüsü
	bindsym Print exec slurp | grim -g -
	# super + Prtsc ile tüm ekran görüntüsü
	bindsym $mod+Print exec grim 


Yapılandırma
^^^^^^^^^^^^
**/etc/sway/config** dosyası ana yapılandırma dosyasıdır.
Bununla birlikte **~/.config/sway/config** dosyasından kendi kullanıcınıza özel ayarlama yapabilirsiniz.

