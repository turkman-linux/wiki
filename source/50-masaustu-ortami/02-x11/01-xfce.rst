Xfce
====
Xfce kolay kullanılan ve en çok tercih edilen masaüstü ortamlarından biridir.

.. image:: /_static/images/xfce-desktop.png
  :width: 400

Kurulumu
^^^^^^^^
Ymp kullanarak xfce yüklemek için aşağıdaki komutu kullanabilirsiniz.

.. code-block:: shell

	$ ymp install @xfce.base

Ek paketleri yüklemek için ise **@xfce.extra** yüklemelisiniz.

xinitrc ayarları
++++++++++++++++
**startx** komutu çalıştırdığınızda xfce başlatılmasını istiyorsanız **~/.xinitrc** dosyanızın sonuna aşağıdaki gibi ekleme yapmalısınız.

.. code-block:: shell

	exec startxfce4

Ayrıca startx yerine doğrudan **startxfce4** komutunu kullanabilirsiniz.

Bununla birlikte elogind gerektiği için :ref:`elogind<elogind>` etkinleştirmelisiniz.
