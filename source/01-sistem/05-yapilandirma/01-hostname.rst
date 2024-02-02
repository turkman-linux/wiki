Hostname ayarlama
=================
Makina adımızı ayarlamak için öncelikle belirlediğimiz makina adını **/etc/hostname** dosyasına yazalım.

.. code-block:: shell

	$ echo "sunucu01" > /etc/hostname

Ardından hostname servisini yeniden başlatalım.

.. code-block:: shell

	$ rc-service hostname restart

Eğer makina adının her açılışta aynı kalmasını istiyorsak servisi etkinleştirelim.

.. code-block:: shell

	$ rc-update add hostname

Servis yöneticisini kullanmadan **hostname** komutunu kullanarak makina adını değiştirmek mümkündür.

.. code-block:: shell

	$ hostname sunucu01

**Not:** Makina adı belirlerken belirlerken aşağıdaki kurallara dikkat etmelisiniz:

* büyük harf içermemeli
* ilk harf sayı olmamalı
* 253 karakterden uzun olmamalı
* türkçe karakter içermemeli
