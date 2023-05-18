Dil ayarlama
============
Sistem dilini ayarlamak için öncelikle **/etc/locale.gen** dosyamızı aşağıdaki gibi düzenleyelim.

.. code-block:: shell

	...
	tr_TR.UTF-8 UTF-8

**Not:** An altta boş bir satır bulunmalıdır.

Ardından /lib64/locale dizini yoksa oluşturalım.

.. code-block:: shell

	mkdir -p /lib64/locale/

Şimdi de çevresel değişkenlerimizi ayarlamak için **/etc/profile.d/locale.sh** dosyamızı düzenleyelim.

.. code-block:: shell

	#!/bin/sh
	# Language settings
	export LANG="tr_TR.UTF-8"
	export LC_ALL="tr_TR.UTF-8"

**Not:** Türkçe büyük küçük harf dönüşümü (i -> İ ve ı -> I) asii standartına uyumsuz olduğu için **LC_ALL** kısmını türkçe ayarlamayı önermiyoruz. bunun yerine **C.UTF-8** veya **en_US.UTF-8** olarak ayarlayabilirsiniz.

Son olarak **locale-gen** komutunu çalıştıralım.

.. code-block:: shell

	locale-gen

Eğer **/lib64/locale/** dizine okuma iznimiz yoksa verelim.

.. code-block:: shell

	chmod 755 -R /lib64/locale/

Son olarak sistemi yeniden başlatalım.

.. code-block:: shell

	openrc-shutdown -r

