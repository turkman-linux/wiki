Zaman dilimi ayarlama
=====================
Öncelikle saat ayarlamak için **tzdata** paketine ihtiyacımız bulunmaktadır. Bu paket saat dilimlerini ayarlamaya yarar.

ymp ile yüklemek için:

.. code-block:: shell

	$ ymp install tzdata

Saat dilimi ayarımız **/etc/localtime** içerisinde bulunur. Örneğin **UTC** için

.. code-block:: shell

	$ cat /etc/localtime
	<-00>0

Saati şehrinize göre ayarlamak için **/usr/share/zoneinfo/** içerisinden uygun olanı bulup buraya sembolik bağlama yapalım.

.. code-block:: shell

	$ ln -s /usr/share/zoneinfo/Asia/Istanbul /etc/localtime

Eğer saatiniz hatalı ise :ref:`ntpd<ntpd>` kullanarak internet üzerinden güncellemesini sağlayabilirsiniz.
