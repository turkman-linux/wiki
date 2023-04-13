Linux Firmware
==============
**linux-firmware** linux çekirdeği ile gelmeyen sürücüleri içerir.
Bu sürücüler sayesinde wifi gibi bazı ek donanımlar çalışabilmektedir.

linux-firmware kurulumu
^^^^^^^^^^^^^^^^^^^^^^^
linux-firmware Türkmen deposunda paket olarak yer almaz.
Bunun yerine **mklinux** paketi içerisinde yer alan **mkfw** komutu yardımı ile kurulur.
Bunun için incelikle mklinux kuralım.

.. code-block:: shell

	$ ymp install mklinux

Ardından **mkfw** ile linux-firmware kurulumun gerçekleştirelim.

.. code-block:: shell

	$ mkfw -i

**Not:** Alternatif olarak https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git adresinden arşivi indirin.
Bir dizine açın. Ardından **make install** komutu ile kurun. 


Son olarak initramfs imajımızı güncellememiz gerekebilir. Bunun için aşağıdaki komutu kullanabiliriz.

.. code-block:: shell

	$ update-initramfs -u -k <kernel-sürümü>


