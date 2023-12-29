Polkit
=====
Polkit yetkisiz uygulamaların yetkili olan uygulamalar ile iletişim kurmasını sağlayan bir araçtır. Örneğin gparted gibi uygulamaları başlatmak için **pkexec** komutu ile root yetkisi sağlanır.

Kurulum
^^^^^^^
ymp ile **polkit** yüklemek için aşağıdaki komut kullanılır:

.. code-block:: shell

	$ ymp install polkit

Ardından polkitin servisi için gereken dosyalara **suid** yetkisi verelim.

.. code-block:: shell

	$ chmod 4755 /usr/bin/pkexec
	$ chmod 4755 /usr/lib/polkit-1/polkit-agent-helper-1

Sonra servisi etkinleştirelim.

.. code-block:: shell

	$ rc-update add polkit # açılışta başlaması için
	$ rc-service polkit start # başlatmak için

Polkit-agent
^^^^^^^^^^^^
Kullandığınız masaüstüne göre polkit-agent yüklemeniz gereklidir. Aşağıda tablo olarak gerekenler verilmiştir.

.. list-table:: Polkit Agent Listesi
   :widths: 30 30 30
   :header-rows: 1
   
   * - Masaüstü
     - paket
     - sağladığı komut
   * - Kde
     - polkit-kde-agent
     - /usr/lib64/libexec/polkit-kde-authentication-agent-1
   * - lxde
     - lxsession
     - /usr/bin/lxpolkit
   * - cinnamon
     - polkit-gnome
     - /usr/libexec/polkit-gnome-authentication-agent-1
   * - xfce
     - xfce-polkit
     - /usr/libexec/xfce-polkit

Not: polkit agent desdeği olmayan masaüstülerde **polkit-gnome** kullanabilirsiniz.

