AppImage
========
AppImage paketleri tüm bağımlılıkları içerisinde kurulu gelen tek dosyadan oluşan uygulama paketleridir.
Bu paketler sayesinde uygulamaları sürümden bağımsız şekilde ve ek bağımlılık kurmadan kullanabilirsiniz.

AppImage için :ref:`fuse<fuse>` yüklemeniz gerekmektedir.

AppImage dosyalarına https://appimage.github.io/ ve https://www.appimagehub.com/ adreslerinden ulaşabilirsiniz.

AppImage çalıştırmak
^^^^^^^^^^^^^^^^^^^^
Öncelikle dosyayı çalıştırılabilir yapmalısınız.

.. code-block:: shell

	$ chmod 755 dosya.appimage

Daha sonra dosyayı komut çalıştırır gibi çalıştırabilirsiniz.

.. code-block:: shell

	$ ./dosya.appimage

**Not:** AppImage dosyaları herhangi bir güvenlik kontrolünden geçirilmediği için güvenilir olmayan kaynaklardan gelen dosyaları çalıştırmayınız.

AppImage dosyalarını uygulama menüsüne eklemek
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Bunun için https://github.com/TheAssassin/AppImageLauncher adresinden **AppImage Launcher** kullanabilirsiniz.

