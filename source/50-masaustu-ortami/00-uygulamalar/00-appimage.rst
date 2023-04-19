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
Bunun appimage dosyamısa **--appimage-extract** parametresi vererek içini açalım.
Bize **squashfs-root** dizini oluşturulacaktır.
Bu dizini istediğimiz bir yere kopyalayıp aşağıdaki gibi bir uygulama başlatıcısı hazırlayalım.
Bu başlatıcıyı ~/.local/share/applications dizinine koyalım.

.. code-block:: shell


	[Desktop Entry]
	Version=1.0
	Name=Firefox
	Comment=Web Browser
	Exec=/data/user/pingu/firefox/firefox %u
	Icon=/data/user/pingu/firefox/icon.png
	Terminal=false
	Type=Application
	MimeType=text/html;
	Categories=Network;WebBrowser;

Burada MimeType kısmına belirtilen dosyalar birlikte aç menüsünde gözükmesini sağlar.
Bir dosyanın mimetype adına **file --mime dosya** komutu ile ulaşabilirsiniz.
