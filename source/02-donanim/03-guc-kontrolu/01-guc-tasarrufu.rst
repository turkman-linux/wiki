Güç tasarrufu
=============
Linux dağıtımları varsayılan ayarlarda sunucu gibi çalışmak için ayarlanmıştır.
Güç kullanımı açısından herhangi bir kısıtlama olmadığı için güç tasarrufu yapılmaz.
Fakat güç tasarrufunu kendiniz ayarlamanız mümkündür.


İşlemci Governor Ayarları
^^^^^^^^^^^^^^^^^^^^^^^^^
İşlemci çeşitli güç modlarına (governor) sahiptir.
Bu modlar sayesinde duruma göre hızlı çalışma veya daha az güç harcama arasında seçim yapılabilir.

Kullanılabilir modları görmek için:

.. code-block:: shell

	$ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors
	> conservative ondemand userspace powersave performance schedutil

Mevcut seçili olan modu görmek için:

.. code-block:: shell

	$ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
	> schedutil

Modu değiştirmek için:

.. code-block:: shell

	$ echo "powersave" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

Bu şekilde **governor** değiştirerek güç tasarrufu sağlanabilir.

İşlemci çekirdeklerini uykuya almak
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Sistemde bulunan işlemci çekirdeklerini uykuya almak daha az güç kullanımını sağlayabilir.

Bunun için öncelikle kaç çekirdek olduğunu bulalım.

.. code-block:: shell

	$ nproc
	> 24

Şimdi aşağıdaki gibi çekirdeği kapatabiliriz. Örneğin 3. çekirdeği kapatalım:

.. code-block:: shell

	# kapatmak için 0 açmak için 1
	$ echo 0 > /sys/devices/system/cpu/cpu3/online

**Not:** 0. çekirdek kapatılamaz. 

**Not:** 4 veya daha az çekirdeğin açık kalması sisteminizin performansını kötü etkileyebilir.


Platform profile ayarı
^^^^^^^^^^^^^^^^^^^^^^
Bazı donanımlar güç tasarrufu donanımsal profili bulundurur. Eğer mevcutsa aşağıdaki gibi kullanabilirsiniz.

.. code-block:: shell

	# düşük güç
	echo "low-power" > /sys/firmware/acpi/platform_profile
	# normal güç
	echo "power" > /sys/firmware/acpi/platform_profile

Turbo boost ayarı
^^^^^^^^^^^^^^^^^
İşlemciniz turbo boost destekliyorsa linuxta varsayılan olarak açık olarak gelmektedir.
Bu yüksek güç kullanımına sebep olabilir Ayağıdaki gibi kapatabilirsiniz:

.. code-block:: shell

	# kapatmak için
	echo 1 > /sys/devices/system/cpu/intel_pstate/no_turbo
	echo 0 > /sys/devices/system/cpu/cpufreq/boost
	# açmak için
	echo 0 > /sys/devices/system/cpu/intel_pstate/no_turbo
	echo 1 > /sys/devices/system/cpu/cpufreq/boost


