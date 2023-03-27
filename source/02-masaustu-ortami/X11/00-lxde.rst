LXDE
====
Lxde hafif masaüstü ortamıdır. Az kaynak kullanması ve nadiren güncelleme aldığı için tercih edilir.

.. image:: /_static/images/lxde-desktop.jpg
  :width: 400

Kurulumu
^^^^^^^^
Ymp kullanarak lxde yüklemek için aşağıdaki komutu kullanabilirsiniz.

.. code-block:: shell

	$ ymp install @lxde

Lxde openbox pencere yöneticisi ile çalışır. Bu yüzden openbox yüklemeniz gerekmektedir.

.. code-block:: shell

	$ ymp install openbox

xinitrc ayarları
++++++++++++++++
**startx** komutu çalıştırdığınızda lxde başlatılmasını istiyorsanız **~/.xinitrc** dosyanızın sonuna aşağıdaki gibi ekleme yapmalısınız.

.. code-block:: shell

	exec startlxde

Bununla birlikte elogind gerektiği için :ref:`elogind<elogind>` etkinleştirmelisiniz.
