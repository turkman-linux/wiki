Depo oluşturma
==============

Gpg anahtarı oluşturma
^^^^^^^^^^^^^^^^^^^^^^
Eğer yoksa gpg anahtarımızı oluşturalım.

.. code-block:: shell

	gpg --generate-key


Gpg anahtarının repicent değerini bulma
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Şimdi Repicent değerimizi bulalım.

.. code-block:: shell

	gpg --list-keys


Depo için dizin oluşturma
^^^^^^^^^^^^^^^^^^^^^^^^^
Depo olarak kullanılacak dizinimi oluşturalım.
İndex almak için aşağıdaki gibi bir betik yazalım.

.. code-block:: shell

	ymp repo --index ./ \
	    --move --name="main" \
      --gpg:repicent=<repicent-değeri> \
      --verbose
	# --move paketleri taşır
	# --verbose detaylı çıktı verir
	# --name depo adını belirtir
	# --gpg:repicent değeri belirtilen anahtarı kullanır.

Not: **--gpg:repicent** parametresinin değerini açıktan yazmak yerine **/etc/ymp.yaml** dosyası içine yazabilirsiniz.

Paketlerimizi dizine kopyalayıp index alacak olan betiği çalıştırıbiliriz.

Depoyu yayınlama
^^^^^^^^^^^^^^^^
Depoyu bir http server uygulaması kullanarak veya ymp ile yayınlaabilirsiniz.
Örneğin busybox httpd için:

.. code-block:: shell

	busybox httpd -p <port> -h <depo-dizini> -v -f
	# -v detaylı çıktı için
	# -f arkada çalışmasını önlemek için

Python http.server kütüphanesi ile

.. code-block:: shell

	python3 -m http.server <port>

ymp ile

.. code-block:: shell

	ymp httpd --port=<port> --unblock
	# --unblock ctrl-c kullanarak kapatabilmek için.

Depoyu ekleme
^^^^^^^^^^^^^
Yayına aldığımız depo içerisindeki ymp-index.yaml dosyasının adresini alın.
**ymp-index.yaml** yerine **$uri** gelecek şekilde değiştirin.
Elde ettiğiniz adresi depo olarak ekleyin.
Örneğin aşağıdaki gibi bir adres için

.. code-block:: shell

	# Şu bağlantı için şu şekilde eklenir.
	http://10.0.0.2:8000/ymp-index.yaml
	# Şu şekilde eklenir.
	ymp repo --add --name=<depo-adı> 'http://10.0.0.2:8000/$uri'
	# Gpg anahtarını ekleyelim.
	ymp key --add 'http://10.0.0.2:8000/ymp-index.yaml.asc'

Not: Terminalde **$** işareti çift tırnak **"** içerisinde değişken değeri ifade eder.
Bu sebeple tek tırnak **'** işareti içerisinde yazmalısınız.

Son olarak depo indexi güncelleyelim.

.. code-block:: shell

	ymp repo --update

