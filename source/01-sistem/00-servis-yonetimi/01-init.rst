İnit
====
Sistemi başlatmak için herhangi bir servis yöneticisi kullanmak zorunda değilsiniz. Bunun yerine kendiniz bir betik yardımı ile başlatabilirsiniz.

Bunun için **/sbin/init** dosyası oluşturmalı ve içine açılışta çalışacak komutları yazmalısınız.

Bu dosyada sırası ile yapılması gereken işlemler şu şekildedir:

* Gereken çekirdek modülleri yüklenir.

* Dosya sistemi bağlanır.

* Gereken servisler başlatılır (dbus network-manager lightdm gibi)

* /dev/tty* ile giriş yapılması için *getty* çalıştırılır.

Modüllerin yüklenmesi
+++++++++++++++++++++
Varsa systemd-udev veya eudev gibi araçlar kullanılır.

.. code-block:: shell

    # systemd-udevd için
    /lib/systemd/systemd-udevd &
    udevadm trigger -c add
    udevadm settle
    # eudev için
    udevd &
    udevadm trigger -c add
    udevadm settle

Bunun dışında elle yüklemek mümkündür.

.. code-block:: shell

    find /sys/ -name modalias | xargs sort -u | xargs -n 1 modprobe

Dosya sisteminin bağlanması
+++++++++++++++++++++++++++
Basitçe şu şekilde bağlayabilirsiniz.

.. code-block:: shell

    mount -a

Veya **/etc/fstab** dosyasını okuyup gerekli işlemleri gerçekleştirebilirsiniz.

Servislerin başlatılması
++++++++++++++++++++++++
Servisler arkada çalıştırılacağı için init betiğinizi blocklamaması gerekmektedir. Örneğin şu şekilde çalıştırabiliriniz.

.. code-block:: shell

    dbus-daemon --system &
    NetworkManager &
    lightdm &

**Not:** Çıktıları bir dosyaya yönlendirmek hata ayıklamak ve karmaşayı engellemek için daha iyi olabilir.

Getty başlatılması
++++++++++++++++++
Sisteme giriş yapılabilmesi için /dev/tty* için getty başlatılması gerekmektedir.

.. code-block:: shell

    # Örnğin /dev/tty1 için
    /sbin/getty 115200 tty1 &


**Not:** Oturumdan çıkıldığında getty kapanacağı için tekrar başlatmanız gerekebilir.


Dikkat edilmesi gerekenler
++++++++++++++++++++++++++
* İnit pid 1 olarak çalıştığı için asla kapatılmamalıdır. Kapanmayı engellemek için **exec sleep inf** kullanabilirsiniz.

* reboot / poweroff / shutdown komutları servis yöneticilerine ait olduğu için (sysvinit gibi) özel init ile çalışmaz. Bu komutlara **-f** parametresi ekleyebilir veya **/proc/sysrq-trigger** kullanabilirsiniz.

* Özel yazılmış initte servis başlat durdur yeniden başlat gibi özellikler bulunmadığı için elle kontrol sağlamalısınız.
