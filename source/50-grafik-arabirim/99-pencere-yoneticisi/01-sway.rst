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

Yapılandırma
^^^^^^^^^^^^
**/etc/sway/config** dosyası ana yapılandırma dosyasıdır.
Bununla birlikte **~/.config/sway/config** dosyasından kendi kullanıcınıza özel ayarlama yapabilirsiniz.

