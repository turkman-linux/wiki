Basit Kurulum
=============
Bu bölümde **Ext4** dosya sistemine grub kullanarak kurulum anlatılacaktır.
Anlatım boyunca **/dev/sda** diski üzerinden örnekleme yapılmıştır. Siz kendi diskinize göre düzenleyebilirsiniz.

Uefi - Legacy tespiti
^^^^^^^^^^^^^^^^^^^^^
**/sys/firmware/efi** dizini varsa uefi yoksa legacy sisteme sahipsinizdir.
Eğer uefi ise ia32 veya x86_64 olup olmadığını anlamak için **/sys/firmware/efi/fw_platform_size** içeriğine bakın.

.. code-block:: shell

	[[ -d /sys/firmware/efi/ ]] && echo UEFI || echo Legacy
	[[ "64" == $(cat/sys/firmware/efi/fw_platform_size) ]] && echo x86_64 || ia32

Disk Bölümlendirme
^^^^^^^^^^^^^^^^^^
Uefi kullananlar ayrı bir disk bölümüne ihtiyaç duyarlar.
Bu bölümü **fat32** olarak bölümlendirmeliler.

Bu anlatımda kurulum için **/boot** dizinini ayırmayı ve efi bölümü olarak aynı diski kullanmayı tercih edeceğiz.

Öncelikle **cfdisk** veya **fdisk** komutları ile diski bölümlendirelim.

.. code-block:: shell

	$ cfdisk /dev/sda

Ardından boot bölümünü ve kök dizini formatlayalım.

.. code-block:: shell

	$ mkfs.vfat /dev/sda1
	$ mkfs.ext4 /dev/sda2

**Not:** ext4 dosya sistemi araçları **e2fsprogs** ile sağlanır.

Eğer /boot bölümünü ayırmayacaksanız grub yüklenirken **unknown filesystem** hatası almanız durumunda aşağıdaki yöntemi kullanabilirsiniz.

.. code-block:: shell

	$ e2fsck -f /dev/sda2
	$ tune2fs -O ^metadata_csum /dev/sda2

Dosya sistemini kopyalama
^^^^^^^^^^^^^^^^^^^^^^^^^
Türkmen linuxta kurulum medyası **/cdrom** dizinine bağlanır.
Kurulacak sistemin imajını bir dizine bağlayalım.

.. code-block:: shell

	$ mount /cdrom/live/filesystem.squashfs /source

Şimdi de bölümlerimizi bağlayalım.

.. code-block:: shell

	# /target yoksa oluşturun.
	$ mount -t ext4 /dev/sda2 /target
	$ mkdir -p /target/boot
	$ mount -t vfat /dev/sda1 /target/boot

Ardından dosyaları kopyalayalım.

.. code-block:: shell

	# -p dosya izinlerini korur
	# -r alt dizinlerle beraber kopyalar
	# -f soru sormayı kapatır
	# -v detaylı çıktıları gösterir
	$ cp -prfv /source/* /target

Daha sonra diski senkronize edelim.

.. code-block:: shell

	$ sync

Bootloader kurulumu
^^^^^^^^^^^^^^^^^^^
Sisteme **ymp chroot** komutu ile girelim.

.. code-block:: shell

	$ ymp chroot /target
	# Bunun yerine aşağıdaki gibi de girilebilir.
	for dir in /dev /sys /proc /run /tmp ; do
		mount -bind /$dir /target/$dir
	done
	$ chroot /target

Şimdi de eğer uefi kulanıyorsanız efivar bağlayalım.

.. code-block:: shell

	$ mount -t efivarfs efivarfs /sys/firmware/efi/efivarfs

Grub paketini yükleyelim.

.. code-block:: shell

	$ ymp install grub

Son olarak grub kurulumu yapalım.

.. code-block:: shell

	# biz /boot ayırdığımız ve efi bölümü olarak kullanacağız.
	# uefi kullanmayanlar --efi-directory belirtmemeliler.
	# kurulu sistemden bağımsız çalışması için --removable kullanılır.
	$ grub-install --removable --boot-directory=/boot --efi-directory=/boot /dev/sda


Grub yapılandırması
^^^^^^^^^^^^^^^^^^^
Öncelikle uuid değerimizi bulalım.

.. code-block:: shell

	$ blkid | grep /dev/sda2
	/dev/sda2: UUID="..." BLOCK_SIZE="4096" TYPE="ext4" PARTUUID="..."

Şimdi aşağıdaki gibi bir yapılandırma dosyası yazalım ve /boot/grub/grub.cfg dosyasına kaydedelim.
Burada uuid değerini ve çekirdek sürümünü düzenleyin.

.. code-block:: shell

	search --fs-uuid --no-flopy --set=root <uuid-değeri>
	linux /boot/vmlinuz-<çekirdek-sürümü>	root=UUID=<uuid-değeri> rw quiet
	initrd /boot/initrd.img-<çekirdek-sürümü>
	boot


Ayrıca otomatik yapılandırma da oluşturabiliriz.

.. code-block:: shell

	$ grub-mkconfig -o /boot/grub/grub.cfg


Fstab dosyası
^^^^^^^^^^^^^
Bu dosyayı doldurarak açılışta hangi disklerin bağlanacağını ayarlamalıyız.
Aşağıdakine uygun olarak doldurun.

.. code-block:: shell

	# <fs>			<mountpoint>	<type>		<opts>		<dump/pass>
	/dev/sda1	/boot	vfat	defaults,rw	0	1
	/dev/sda2	/	ext4	defaults,rw	0	1

**Not:** Disk bölümü konumu yerine **UUID="<uuid-değeri>"** şeklinde yazmanızı öneririm.
Bölüm adları değişebilirken uuid değerleri değişmez.

