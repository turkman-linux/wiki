Bluetooth
=========
Bluetooth bağlantısı sağlamak için bluez kullanılır.
Ayrıca buletooth kartının sürücüsü için :ref:`linux-firmware<linux-firmware>` gerekmektedir.

Kurulum
^^^^^^^
Öncelikle **bluez** kurulumu yapalım.

.. code-block:: shell

	$ ymp install bluez

Ardından servisi etkinleştirelim.

.. code-block:: shell

	$ rc-update add bluetooth
	$ rc-service bluetooth start


Bağlantının kurulması
^^^^^^^^^^^^^^^^^^^^^
İlk olarak klavye mouse gibi aygıtları bağlayabilmek için gerekli modülü yükleyelim.

.. code-block:: shell

	modprobe uhid

Bunu açilişta yüklemek için aşağıdaki gibi ekleme yapabilirsiniz.

.. code-block:: shell

	echo uhid > /etc/modules-load.d/bluetooth.conf

**bluetoothctl** komutu ile bağlantı kurmamız mümkündür. Öncelikle kullanılabilir aygıtları görüntüleyelim.

.. code-block:: shell

	$ bluetoothctl scan on
	...
	[NEW] Device 1A:AA:D4:9C:8D:F5 Xiaomi Mi 6X
	...

Arama modundan **ctrl+c** ile çıkalım.
Çıktıdan bağlanmak istediğimiz aygıtın adresini alalım ve aşağıdaki gibi eşleştirelim.

.. code-block:: shell

	$ bluetoothctl pair 1A:AA:D4:9C:8D:F5

Şimdi de bağlanalım.


.. code-block:: shell

	$ bluetoothctl connect 1A:AA:D4:9C:8D:F5

**Not:** Özellikle dual boot kullanıyorsanız donanım sürekli olarak farklı şekilde haberleşmeye çalıştığı için bağlanma sorunları oluşabilir.
Bu durumun üstesinden gelmenin en basit yolu aygıtı kaldırıp tekrar eklemektir.


Otomatik bağlanma
^^^^^^^^^^^^^^^^^
Her seferinde bağlantıyı elle yapmayıp aygıta güvenmek için aşağıdaki komutu uygulayabilirsiniz.

.. code-block:: shell

	$ bluetoothctl trust 1A:AA:D4:9C:8D:F5

Aygıtı kaldırma
^^^^^^^^^^^^^^^
Bağlantıyı kesmek için öncelikle tanınan aygıt listesine bakalım.

.. code-block:: shell

	$ bluetoothctl devices

Şimdi aygıtın bağlantısını keselim.

.. code-block:: shell

	$ bluetoothctl disconnect 1A:AA:D4:9C:8D:F5

Ardından aygıtı silelim.

.. code-block:: shell

	$ bluetoothctl remove 1A:AA:D4:9C:8D:F5


