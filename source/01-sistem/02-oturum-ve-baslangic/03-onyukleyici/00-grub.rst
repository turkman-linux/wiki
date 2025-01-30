Grub
^^^^
Grub linux dağıtımlarının genelinde tercih edilen önyükleyicidir.

Kurulum
+++++++
Grub yüklemek için öncelikle aşağıdaki gibi kurulum yapmalıyız.

.. code-block:: shell

	$ ymp install grub

Ardından önyükleyicimizi diske aşağıdaki gibi yüklememiz gerekmektedir.

.. code-block:: shell

	# x86_64-efi UEFI bios için. i386-pc legacy bios için
	# /dev/sda kurulacak diskin adı
	$ grub-install --target=x86_64-efi /dev/sda

Yapılandırma
++++++++++++
Grub yapılandırma dosyası **/boot/grub/grub.cfg** dosyasıdır.
Bu dosyayı elle yazabilir veya **grub-mkconfig** komutu ile otomatik oluşturabilirsiniz.

.. code-block:: shell

	$ grub-mkconfig -o /boot/grub/grub.cfg

Yapılandırma dosyasına yazacağımız komutlar grub konsolunda çalıştırılır.
Örneğin dağıtımımızı otomatik olarak başlatmak için:

.. code-block:: shell

	insmod all_video
	set root=(hd0,gpt2)
	linux /boot/linux-6.13 root=/dev/sda2 rw quiet
	initrd /boot/initrd.img-6.13
	boot

* İlk komut grub ekranında **all_video** modülü yüklemek için
* İkinci komut Hangi diskten açılacağını belirlemek için
* Üçüncü komut çekirdeği ve parametrelerini belirlemek için
* Döndüncü komut initramfs dosyası belirlemek için
* Son komut başlatmak için

Menü oluşturmak için ise aşağıdaki gibi bir yol izlenebilir:

.. code-block:: shell

	menuentry "Linux" --class linux {
	   ...
	}

Burada dikkat edilmesi gereken menü altında boot komutuna ihtiyacımızın olmamasıdır.

Grub konsolu
++++++++++++
Eğer bir yapılandırma dosyanız yoksa, dosyada bir hata varsa, veya **c** tuşuna bastıysanız grub konsolu açılır.
Bu ekranda elle açılışı sağlayabilirsiniz.

Bu konsolda kullanacağınız komutların listesine **help** ile ulaşabilirsiniz.

.. code-block:: shell

	$ help

Var olan diskleri listelemek için **ls** kullanılır. Eğer bir diskin içerisini listelemek isterseniz ise bu komuttan sonra o diski parametre olarak vermelisiniz.

.. code-block:: shell

	$ ls (hd0,gpt2)/

**set** komutu bir değişken ayarlamayı sağlar. **root** değişkeni açılışın yapılacağı diski belirlemenizi sağlar.

.. code-block:: shell

	$ set root=(hd0,gpt2)

**insmod** modül yüklemeyi sağlar. Örneğin:

.. code-block:: shell

	$ insmod ext2

**linux** komutu çekirdeği yüklemeyi ve parametreleri ayarlamayı sağlar

.. code-block:: shell

	$ linux /boot/linux-6.13 rw quiet root=/dev/sda2

**initrd** komutu initramfs dosyasını belirlemeye yarar.

.. code-block:: shell

	$ initrd /boot/initrd.img-6.13

**exit** bir sonraki önyükleyiciye geçmeyi sağlar. Eğer bir sonraki önyükleyici mevcut değilse yeniden başlatır.

.. code-block:: shell

	$ exit

**terminal_output** komutu ile terminal çıktı modunu değiştirebilirsiniz.

.. code-block:: shell

	$ terminal_output console


