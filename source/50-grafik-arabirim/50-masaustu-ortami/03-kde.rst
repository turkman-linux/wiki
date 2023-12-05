Kde
====
Kde kolay kullanılan ve oldukça fazla özelliğe sahip masaüstü ortamlarından biridir.

.. image:: /_static/images/plasma-desktop.png
  :width: 400

Kurulumu
^^^^^^^^
Ymp kullanarak kde yüklemek için aşağıdaki komutu kullanabilirsiniz.

.. code-block:: shell

	$ ymp install @kde.plasma @kde.frameworks dolphin konsole

Ek paketleri yüklemek için ise **@kde.extra** cd **@kde.apps** yüklemelisiniz.

xinitrc ayarları
++++++++++++++++
**startx** komutu çalıştırdığınızda kde başlatılmasını istiyorsanız **~/.xinitrc** dosyanızın sonuna aşağıdaki gibi ekleme yapmalısınız.

.. code-block:: shell

	exec startplasma-x11

Bununla birlikte elogind gerektiği için :ref:`elogind<elogind>` etkinleştirmelisiniz.
