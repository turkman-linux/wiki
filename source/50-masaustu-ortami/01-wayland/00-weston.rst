Weston
======
Weston basit wayland pencere yöneticisidir. Genellikle test amaçlı kullanılır fakar masaüstü ortamı olarak kullanmak da mümkündür.

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

