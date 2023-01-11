Ymp paket sisteminin kurulumu
=============================
Ymp paket sistemini kaynak koddan derlemek için şu adımlar izlenmelidir.

Gerekli paketlerin kurulması
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Debian tabanlı dağıtımlar için aşağıdaki paketler kurulmalıdır. (testing/unstable için)

.. code-block:: shell

	# Derleyiciler
	$ apt install meson gcc valac --no-install-recommends -y
	# Derleme bağımlılıkları
	$ apt install libarchive-dev libreadline-dev libcurl4-openssl-dev \
	    libbrotli-dev --no-install-recommends -y

