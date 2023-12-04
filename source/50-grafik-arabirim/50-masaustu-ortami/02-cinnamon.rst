Cinnamon
========
Linux mint tarafından geliştirilen kullanıcı dostu bir masaüstü ortamıdır.

.. image:: /_static/images/cinnamon-desktop.png
  :width: 400

Kurulumu
^^^^^^^^
Ymp kullanarak cinnamon yüklemek için aşağıdaki komutu kullanabilirsiniz.

.. code-block:: shell

	$ ymp install @cinnamon

Cinnamon masaüstü ortamı gnome çatalıdır ve bazı uygulamaları doğrudan gnome uygulamasıdır.
Bunlar masaüstünün parçası olarak gelmediği için kendiniz yüklemelisiniz.

.. code-block:: shell

	$ ymp install gnome-terminal gnome-screenshot polkit-gnome

xinitrc ayarları
++++++++++++++++
**startx** komutu çalıştırdığınızda xfce başlatılmasını istiyorsanız **~/.xinitrc** dosyanızın sonuna aşağıdaki gibi ekleme yapmalısınız.

.. code-block:: shell

	exec cinnamon-session-cinnamon

Bununla birlikte elogind gerektiği için :ref:`elogind<elogind>` etkinleştirmelisiniz.
