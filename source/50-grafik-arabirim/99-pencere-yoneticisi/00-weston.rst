Weston
======
Weston basit wayland pencere yöneticisidir. Genellikle test amaçlı kullanılır fakat masaüstü ortamı olarak kullanmak da mümkündür.

.. image:: /_static/images/weston-desktop.jpg
  :width: 400

Yükleme
^^^^^^^
Ymp kullanarak weston yüklemek için **weston** paketini yüklemelisiniz.

Ardından **seatd** ve **devfs** servislerini etkinleştirmelisiniz.

.. code-block:: shell

	# paketi kuralım
	$ ymp install weston
	# servisleri etkinleştirmek için
	$ rc-update add seatd
	$ rc-update add devfs
	# servisleri açmak için
	$ rc-service devfs start
	$ rc-service seatd start

Çalıştırma
^^^^^^^^^^
Çalıştırmak için tty ekranındayken eğer **seatd** servisi açıksa doğrudan **weston** komutu ile oturum açabilirsiniz.
Service açmadıysanız **seatd-launch weston** komutu kullanabilirsiniz.

Not: X11 içerisinde weston çalıştırırsanız weston pence modunda çalıştırılacaktır. Bu sayede X11 üzerinde weston uygulamalarını test etebilirsiniz.

Weston'un Parametreleri
+++++++++++++++++++++++
Weston'u çalıştırdığınızda, birkaç parametre ile özelleştirebilirsiniz. İşte temel kullanım ve bazı parametreler:

.. code-block:: shell

    $ weston [OPTIONS]
        -B, --backend=BACKEND: Weston'un kullanacağı grafik arka uçunu belirtir. Örneğin, "drm-backend", "wayland-backend", "fbdev-backend" gibi.
        --fullscreen: Weston'u tam ekran modunda başlatır.
        --width=WIDTH, --height=HEIGHT: Weston penceresinin genişliğini ve yüksekliğini belirtir.
        --no-config: Weston'u hiçbir yapılandırma dosyasını kullanmadan başlatır.
        --config=FILE: Belirli bir yapılandırma dosyasını kullanarak Weston'u başlatır.
        --idle-time=SECONDS: Weston'un ne kadar süre boşta kaldıktan sonra oturumu kapatması gerektiğini belirtir.
        --log=LEVEL: Weston'un log seviyesini belirtir (örneğin, "debug", "error", "critical").

Örnek bir kullanım:

.. code-block:: shell

    $ weston --backend=drm-backend --fullscreen --width=1920 --height=1080

Bu komut, Weston'u DRM (Direct Rendering Manager) arka uç kullanarak tam ekran modunda ve 1920x1080 çözünürlükte başlatacaktır.

Yapılandırma
++++++++++++
Weston'un yapılandırma dosyası ~/.config/weston.ini veya /etc/xdg/weston/weston.ini gibi konumlarda bulunabilir. Bu dosyayı özelleştirebilirsiniz. 

Örneğin:

.. code-block:: shell

    [core]
    modules=desktop-shell.so

    [shell]
    background-image=/usr/share/backgrounds/gnome/Aqua.jpg

Bu örnekte, Weston'un masaüstü kabuğu olarak "desktop-shell" modülünü kullanmasını ve bir arka plan resmi belirtmesini sağlar.
Weston Modülleri

Weston modülleri, Weston'un davranışını genişleten eklentilerdir. Örneğin, "desktop-shell" modülü masaüstü yönetimini sağlar. Weston modüllerini weston.ini dosyanızda belirleyebilirsiniz.

