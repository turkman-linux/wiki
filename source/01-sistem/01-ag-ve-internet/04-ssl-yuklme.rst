Ssl sertifikası yükleme
^^^^^^^^^^^^^^^^^^^^^^^
Eğer elimizde .crt uzantılı bir dosya varsa ve bunu metin düzenleyici ile açamıyorsak aşağıdaki gibi .pem uzantılı hale çevirelim:

..code-block:: shell

	$ openssl x509 -in ./my-ssl-cert.crt -out ./my-ssl-cert.pem -outform PEM

İlk olarak elimizde bulunan ssl sertifikası (.pem uzantılı) **/usr/share/ca-certificates/custom** dizini oluşturup içine kopyalayalım.

.. code-block:: shell

	$ mkdir -p /usr/share/ca-certificates/custom/
	$ cp ./my-ssl-cert.pem /usr/share/ca-certificates/custom/my-ssl-cert.pem

Ardından ssl veritabanını güncelleyelim.

.. code-block:: shell

	$ update-ca-certificates

Ardından eğer varsa bundle dosyasına ekleyelim.

.. code-block:: shell

	$ echo "My SSl Cert" >> /etc/ssl/cert.pem
	$ cat ./my-ssl-cert.pem >> /etc/ssl/cert.pem

Firefox için yükleme
++++++++++++++++++++
Firefox ssl sertifikasını sistem üzerinden kullanmak yerine kendi içerisinde bulunan sertifikalara bakar.
Bu sebeple firefox için de elle yüklemek gerekli olabilir.

Bunun için sırasıyla:

..code-block:: shell

  -> Ayarlar
  -> Gizlilik ve Güvenlik
  -> Sertifikalar
  -> Sertifikaları göster...
  -> Makamlar
  -> İçe aktar...

Kısmından .pem uzantılı dosyanızı güven kutucuklarını işaretleyip ekleyin.
