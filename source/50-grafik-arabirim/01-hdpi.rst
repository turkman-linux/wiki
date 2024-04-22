HDPI
####
Yüksek çözünürlüklü ve küçük boyutlu ekranlar HDPI (High Dots Per Inch) ekran olarak adlandırılır.

Bu tür ekranlarda varsayılan olan ölçekleme değeri ile kullanım yazıların çok küçük kalmasına sebep olabilir. Bu sebeple ölçekleme gerekebilir.

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

