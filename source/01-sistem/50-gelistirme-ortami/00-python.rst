Python 
======
Python kurulumu
^^^^^^^^^^^^^^^
Python yüklemek için **ymp install python** komutunu kullanmalısınız.

.. code-block:: shell

	$ ymp install python

Kaynak koddan yüklemek için aşağıdaki adımları takip ediniz.

1. https://python.org adresinden kaynak kodu indirin ve bir dizine açın.
2. kaynak kodun içerisinde aşağıdaki komutları kullanarak derleyin.

.. code-block:: shell

	$ autoreconf -fvi
	$ ./configure
	$ make
	$ make install

Türkmen linux size birden çok python sürümünü aynı anda kullanmasına olanak tanır.
Bunun için **pydefault** komutu kullanarak varsayılan sürümü değiştirebilirsiniz.

.. code-block:: shell

	$ pydefault 3.10

**Not:** python paketi kurulurken var olan en üst sürümü varsayılan olarak ayarlamaktadır.

**Not:** En üst sürümü kullanmamak sistemin ve uygulamaların düzgün çalışmamasına sebep olabilir.

Pip etkinleştirilmesi
^^^^^^^^^^^^^^^^^^^^^
pip komutunu etkinleştirmek için aşağıdaki komutu kullanın.

.. code-block:: shell

	$ python3 -m ensurepip
	$ pip3 install --upgrade pip

İlk komut python ile gelen pip modülünü çalıştırarak pip kullanmanıza olanak tanır.
İkinci komut ise pip sürümünü güncellemek için kullanılır.
