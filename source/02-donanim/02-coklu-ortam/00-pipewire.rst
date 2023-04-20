Pipewire
========
Pipewire çoklu ortam yöneticisidir.

Türkmen linuxta pipewire pulseaudio yerine kullanılır ve pipewire-pulse pakete dahildir.

Kurulumu
^^^^^^^^
**pipewire** paketini yüklemeniz gerekmektedir.
Ardından **wireplumber** yükleyip masaüstü ortamı ile çalışmasını sağlamalısınız.

.. code-block:: shell

	$ ymp install pipewire wireplumber

Kurulum tamamlandıktan sonra oturumunuzu kapatıp açmanız gerekebilir.

Çalışıp çalışmadığını test etmek için **pactl info** ve **wpctl status** komutlarını kullanarak pipewire ile ilgili bilgi alabilirsiniz.

Uzak makinaya bağlanma
^^^^^^^^^^^^^^^^^^^^^^
Öncelikle gerekli modülü sunucu olarak kullanılacak makinada aşağıdaki komut ile etkinleştirelim.

.. code-block:: shell

	# Bu kısım sesi alacak olan makinada çalıştırılır.
	# auth-ip-acl parametresini yazmazsanız herkes tarafından elişilebilir olur.
	# Sadece bu parametre ile belirtilen ip adresine izin verilir.
	# Birden çok ip belirtmek için aralarına ; işareti koyulmalıdır.
	$ pactl load-module module-native-protocol-tcp auth-ip-acl=192.168.0.18;192.168.0.15

Daha sonra bağlantı kurmak için **PULSE_SERVER** çevresel değişkenini kullanabiliriz.

.. code-block:: shell

	# Bu kısım sesi gönderecek olan makinada çalıştırılır.
	$ export PULSE_SERVER=192.168.0.12
	$ mpv /home/pingu/test.mkv


