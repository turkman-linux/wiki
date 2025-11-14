Çoklu ekran kartı
=================
Eğer birden çok ekran kartınız varsa varsayılan olarak ilk ekran kartı kullanılır.
Diğer ekran kartınızı kullanmak için **DRI_PRIME** çevresel değişkeni ayarlamamız gerekir.

Öncelikle ekran kartlarını listeleyelim:

.. code-block:: shell

	$ lspci | grep -ie vga -ie 3d
	# X11 kullanıyorsanız
	$ xrandr --listproviders

İkinci ekran kartını kullanmak için uygulamayı aşağıdaki gibi çalıştıralım.

.. code-block:: shell

	# 1 numaralı ekran kartı (2. ekran kartı) için:
	$ DRI_PRIME=1 firefox

Eğer sürekli olarak belirlediğiniz ekran kartını kullanmak isterseniz bu değişkeni **/etc/profile.d/** dizini 
altında tanımlamanız yeterli olur.

.. code-block:: shell

	echo "export DRI_PRIME=1" > /etc/profile.d/dri_prime.sh

**Not:** Bu işlem grafik arabirimde çeşitli sorunlara ve aşırı güç kullanımına sebep olabilir.

