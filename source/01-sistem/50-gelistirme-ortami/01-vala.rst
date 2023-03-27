Vala
====
Vala yazılan kaynak kodu **C** koduna çevirip daha sonra derleyerek çalışan bir programlama dilidir.
**valac** kullanılarak derlenir.
Valac kurulumu
^^^^^^^^^^^^^^
Vala derleyicisini (valac) yüklemek için **ymp install vala** komutunu kullanabilirsiniz.

.. code-block:: shell

	$ ymp install vala

Kaynak koddan derlemek için ise aşağıdaki adımları takip ediniz:

1. https://gitlab.gnome.org/GNOME/vala adresinden kaynak kodu indirin ve bir dizine çıkarın
2. kaynak kodun içerisine girerek aşağıdaki komutları çalıştırarak derleyin.

.. code-block:: shell

	$ autoreconf -fvi
	$ ./configure
	$ make
	$ make install

Nano renklendirme desteği
^^^^^^^^^^^^^^^^^^^^^^^^^
Kaynak kod yazmak için nano kullanabilirsiniz. Nanoda renklendirme için valaya destek bulunmamaktadır. Vala ile **java** ve **c#** progmarmala dillerinin renklendirmesi birbirine benzer olduğu için kopyasını kullanarak vala yazarken renklendirme yapabilirsiniz.

Bunun için aşağıdaki yolu izleyin.

1. **/usr/share/nano/** içerisindeki **java.nanorc** dosyasını kopyalayıp aynı dizine **vala.nanorc** olarak kaydedin.
2. Kopyaladığınız dosyayı açın ve java yazan yerleri vala olarak değiştirin.
3. **foreach** ifadesi javada yer almadığı için eksik renklendirilecektir. Bunu nanorc dosyasına elle ekleyebilirsiniz.

