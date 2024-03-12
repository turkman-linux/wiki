Sık karşılaşılabilen problemler             
===============================
Bu başlık altında sıkça karşılaşılabilen hatalar ve olası çözümleri anlatılmaktadır.

docbook-xsl / docbook-xml hataları
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Eğer docbook ile ilgili **add command failed** hatası alıyorsanız. aşağıdaki yolu izleyin.

1- /etc/xml/catalog dosyasını silin

.. code-block:: shell

	rm -f /etc/xml/catalog

2- docbook-xml ve docbook-xsl paketlerinin sysconf yapılandırmasını silin.

.. code-block:: shell

	$ rm -f /var/lib/ymp/sysconf/docbook-xsl/postinstall.done
	$ rm -f /var/lib/ymp/sysconf/docbook-xml/postinstall.done

3- sysconf modellerini sırası ile elle tetikleyin.

.. code-block:: shell

	$ bash -e /etc/sysconf.d/docbook-xml
	$ bash -e /etc/sysconf.d/docbook-xsl


