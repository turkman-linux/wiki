ACPI
====
Acpi (Advanced Configuration and Power Interface) bilgiayarınızın güç yönetimini ve donanımını kontrol etmenizi sağlayan bir arayüz standartıdır.
Acpi uykuya alma güç tasarrufu ve benzeri işlemleri kontrol eder.

Acpi tabloları
^^^^^^^^^^^^^^
Bilgisayarınızın acpi tabloları bulunur ve işletim sistemi buraya bakarak çalışır.
Bilgisayarınız doğrudan linux için acpi tablosuna sahip olmayabilir. Bu durumda linux diğer sistemlere ait acpi tablolarını kullanmaya çalışır.
Bu durum bilgisayarınızın kararlı çalışmamasına sebep olabilir.

Bilgisayarınızın linux için bir ACPI tablosuna sahip olup olmadığını anlamak için aşağıdaki komutu kullanabilirsiniz.

.. code-block:: shell

	if grep -i linux /sys/firmware/acpi/tables/DSDT 2>/dev/null ; then
	    echo "Acpi linux destekliyor"
	else
	    echo "Acpi linux desteklemiyor"
	fi

Ayrıca bilgisayarınızın bir oem anahtarı varsa acpi tablosundan öğrenebilirsiniz.
Eğer bir oem bulunmuyorsa aşağıdaki dizin bulunmamaktadır.

.. code-block:: shell

    tail -c 32 /sys/firmware/acpi/tables/MSDM && echo

**Not:** OEM bulunan bilgisayarlar acpi sorunlarına sahip olabilir. Bilgisayar satın alırken oem bulunmamasına dikkat etmelisiniz.

Acpi wakeup ayarları
^^^^^^^^^^^^^^^^^^^^

Bilgisayarınızı uyku moduna aldığınızda veya boşta bıraktığınızda enerji tasarrufu amaçlı bazı donanımlar kapatılabilir. Bu durum iyi olsa da bazı durumlarda uykudan uyanamama gibi sorunlara sebep olabilir.

Hangi kesmelerin açık olduğunu görmek için **/proc/acpi/wakeup** içerisine bakabiliriz.

.. code-block:: shell

	cat /proc/acpi/wakeup
	> Device	S-state	  Status   Sysfs node
	> GP12	  S4	*enabled   pci:0000:00:07.1
	> GP13	  S4	*enabled   pci:0000:00:08.1
	> XHC0	  S4	*enabled   pci:0000:0b:00.3
	> GP30	  S4	*disabled
	> GP31	  S4	*disabled
	> PS2K	  S3	*disabled
	> PS2M	  S3	*disabled
	> X161	  S4	*disabled
	> SWUS	  S4	*enabled   pci:0000:07:00.0
	> SWDS	  S4	*enabled   pci:0000:08:00.0
	> X162	  S4	*disabled
	> PTXH	  S4	*enabled   pci:0000:01:00.0
	> X1_1	  S4	*disabled
	> WIFI	  S4	*disabled  pci:0000:05:00.0
	> RLAN	  S4	*enabled   pci:0000:06:00.0
	> X162	  S4	*disabled
	> M2_2	  S4	*disabled  pci:0000:04:00.0

Bir argıtın kesmesinin durumunu değiştirmek için aygıtın adını bu dosyaya yazabiliriz.

.. code-block: shell

	# acpi kesmesini durumunu değiştirir.
	echo XHC0 > /proc/acpi/wakeup

Ekran parlaklığı kontrolü
^^^^^^^^^^^^^^^^^^^^^^^^^
Ekran parlaklığı kontolü ile ilgili sorun yaşıyorsanız kontrol yöntemini değiştirebilirsiniz.

Bunun için çekirdeğe **acpi_backlight** parametresi eklemeniz gereklidir.
Bu parametre şu değerleri alabilir.

vendor
+++++++
Bu değer, ekran parlaklığını kontrol etmek için üreticiye özgü yöntemleri kullanır. Genellikle, bu yöntem dizüstü bilgisayarların üreticileri tarafından sağlanan özel sürücülerle birlikte çalışır.

video
+++++
Bu değer, video sürücüsünü kullanarak ekran parlaklığını kontrol eder. Genellikle, bu yöntem genel bir çözüm olarak kabul edilir ve birçok sistemde çalışır.

native
++++++
Bu değer, ACPI'nin yerel yöntemlerini kullanarak ekran parlaklığını kontrol eder.

