Wifi
====
Wifi bağlantısı sağlamak için wpa-supplicant kullanılır.
Ayrıca wifi kartının sürücüsü için :ref:`linux-firmware<linux-firmware>` gerekmektedir.

Wpa-supplicant kurulumu
^^^^^^^^^^^^^^^^^^^^^^^
Öncelikle aşağıdaki gibi gerekli paketi yükleyelim.

.. code-block:: shell

	$ ymp install wpa_supplicant

Ardından servisini başlatalım.

.. code-block:: shell

	# servisi başlangıca ekleyelim
	$ rc-update add wpa_supplicant
	# servisi başlatalım
	$ rc-service wpa_supplicant start

Bağlantının kurulması
^^^^^^^^^^^^^^^^^^^^^
Öncelikle wifi kartımızın donanım adını aşağıdaki komut ile tespit edelim.

.. code-block:: shell

	$ ip addr
	...
	3: wlan0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group default qlen 1000
	   link/ether 8e:d2:82:0e:96:41 brd ff:ff:ff:ff:ff:ff permaddr 08:5b:d6:0c:45:bd
	...

Daha sonra wifi kartımızı çalıştıralım.

.. code-block:: shell

	$ ip link set wlan0 up

Ardından bağlantı için ayar dosyasını oluşturalım.

.. code-block:: shell

	$ wpa_passphrase 'SSID' 'parola' > /etc/wpa_supplicant/wpa_supplicant.conf

Daha sonra **wpa_supplicant** komutunu kullanarak ayar dosyasına göre bağlantı sağlayalım.

.. code-block:: shell

	# -B arkada çalışması için
	# -i donanım adını belirtmek için
	# -c ayar dosyası konumu için
	$ wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf

Bağlantı kurulduktan sonra ip adresi almak için udhcpc kullanalım.

.. code-block:: shell

	$ udhcpc -i wlan0


Network Manager ile kullanılması
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
wpa_supplicant servisini etkinleştirdikten sonra networkmanager servisini yeniden başlatalım.

.. code-block:: shell

	$ rc-service networkmanager restart

Ardından wifi donanımımızı açalım.

.. code-block:: shell

	$ nmcli radio wifi on

Ardından wifi ağlarını listeleyelim.

.. code-block:: shell

	$ nmcli device wifi list

Ardından wifi ağına bağlanalım.

.. code-block:: shell

	# Parolayı sizden yazı girdi olarak sorması için --ask kullanılır.
	$ nmcli device wifi connect "SSID" --ask
	# Parolayı doğrudan komuta ekleyebilirsiniz
	$ nmcli device wifi connect "@" password "password"
