HDPI
####
Yüksek çözünürlüklü ve küçük boyutlu ekranlar HDPI (High Dots Per Inch) ekran olarak adlandırılır.

Bu tür ekranlarda varsayılan olan ölçekleme değeri ile kullanım yazıların çok küçük kalmasına sebep olabilir. Bu sebeple ölçekleme gerekebilir.

Dpi hesaplama
^^^^^^^^^^^^^
Dpi pixel yoğunluğunu ifade eder ve ne kadar büyükse o kadar yüksek kaliteli bir ekrana sahip olduğunuz anlamına gelir. Ekranlar için 96 ve üstü değerler normaldir. Daha düşük değerler ile ekranın kalitesiz olduğunu ifade eder.
Dpi hesaplamak için ekranın inç türünden boyutu ve çözünürlük bilgisi gerekmektedir.

Aşağıdaki python kodu ile hesaplanabilir.

.. code-block:: python

	def calc_dpi(size, height, width):
	    dpi = (height**2 + width**2)**0.5 / size
	    print(dpi)
	# örneğin 1920x1080 ve 23 inç ekran için
	# (1920**2 + 1080**2)**0.5 / 23 = 95.77857261227383
	# örneğin 2560x1440 ve 27 inç ekran için
	# (2540**2 + 1440**2)**0.5 / 27 = 94.9646963498124

Yukarıdaki örnek ekran boyutu ve çözünürlükleri yaklaşık 96dpi olduğu için ölçeklemeye gerek yoktur. 

Sistem varsayılan dpi değerini 96 olarak alır. Ölçeklendirmeyi bu değere göre yapmalısınız.

Gtk için
^^^^^^^^
Gtk ölçeklemek için **GDK_SCALE** değişkeni ayarlanmalıdır.

.. code-block:: shell

	# %200 ölçekleme için
	export GDK_SCALE=2

Yukarıdaki tanımı xinitrc dosyanıza yazmanız gerekmektedir.

**Not:** Sadece tam sayılarda ölçekleme yapılabilmektedir.

Qt için
^^^^^^^
Qt ölçeklemek için **QT_SCALE_FACTOR**  değişkeni ayarlanmalıdır.

.. code-block:: shell

	# %200 ölçeklemek için
	export QT_SCALE_FACTOR=2

Yukarıdaki tanımı xinitrc dosyanıza yazmanız gerekmektedir.

Xft.dpi ayarı
^^^^^^^^^^^^^
Ölçekleme desteği bulunmayan araç setlerinde yalnızca yazıları büyütmeyi deneyebilirsiniz. Bu kötü gözükür fakat en azından okunabilir.

Bunun için **~/.Xresources** dosyasına aşağıdaki gibi ekleme yapalım.

.. code-block:: shell

	Xft.dpi: 192

Ardından **xrdb -merge ~/.Xresources** komutu ile ayarları uygulayalım.

**Not:** Gtk ve Qt için yapılan ölçekleme ile aynı anda kullanılmamalıdır.

