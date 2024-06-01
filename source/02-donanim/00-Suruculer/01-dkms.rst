DKMS
====
DKMS (Dynamic Kernel Module Support) Linux çekirdeği için dinamik sürücü desteği sağlayan bir sistemdir.
Linux çekirdeğine yerleşik olan modüller dışında kalan, yani çekirdek üzerinde doğrudan derlenmeyen sürücülerin yönetimini sağlar.

Kullanımı
^^^^^^^^^
Örneğin /mnt/test dizininde örnek bir kernel modülü olsun.


Bir dkms paketini eklemek için:

.. code-block:: shell

	# modül dizinimizi /usr/src içine kopyalayalım
	cp /mnt/test /usr/src/test
	# modülü ekleyelim:
	dkms add /usr/src/test


Eklediğimiz modülleri listelemek için:

.. code-block:: shell

	dkms status

Eklediğimiz modülü derlemek için:

.. code-block:: shell

	# derlemek istediğimiz modülün adı ve sürümünü gereklidir.
	# Mevcut modüller /var/lib/dkms/ içerisinde bulunur.
	# Bu örnekte test 1.0 olduğunu var sayalım.
	dkms build -m test -v 1.0

derlediğimiz modülü yüklemek için:


.. code-block:: shell

	# zaten var olan bir modülse --force kullanarak üzerine yazabilirsiniz.
	dkms install -m test -v 0.1 --force

Kurulan modülü yüklemek için:

.. code-block:: shell

	# öncelikle modül bağımlılık ağacını güncelleyelim.
	depmod -a
	# modülü yükleyelim
	modprobe test

Çekirdek güncellendiğinde modülleri otomatik olarak derkelem için:

.. code-block:: shell

	# Bu komutu paket sisteminiz otomatik olarak çalıştırıyor olabilir.
	dkms autoinstall

Modülü kaldırmak için:

.. code-block:: shell

	# önce modülü kapatalım
	modprobe -r test
	# modülü silelim
	dkms remove -m test -v 0.1

dkms paketi hazırlama
^^^^^^^^^^^^^^^^^^^^^
Aşağıdaki gibi bir örnek kernel modülümüz olsun:

.. code-block:: c

	#include <linux/module.h>
	#include <linux/kernel.h>
	#include <linux/init.h>
  
	MODULE_LICENSE("GPL"); 
	MODULE_AUTHOR("Your Name"); 
  
	MODULE_DESCRIPTION("Example Module");
	MODULE_VERSION("0.1");
  
	static int __init test_start(void) { 
	    printk(KERN_INFO "Hello world\n"); 
	    return 0; 
	} 
  
	static void __exit test_end(void) {
	    printk(KERN_INFO "Goodbye\n"); 
	} 
  
	module_init(test_start); 
	module_exit(test_end); 

Bu modülü derlemek için aşağıdaki **Makefile** dosyası kullanılır:

.. code-block:: c

	obj-m = test.o
	KERNELVER := $(shell uname -r)
	all:
		make -C /lib/modules/$(KERNELVER)/build/ M=$(PWD) modules
	clean:
		make -C /lib/modules/$(KERNELVER)/build M=$(PWD) clean

Şimdi bu kernel modülüne aşağıdaki gibi **dkms.conf** dosyası oluşturabiliriz:

.. code-block:: c

	PACKAGE_NAME="test"
	PACKAGE_VERSION="0.1"
	CLEAN="make clean"
	MAKE[0]="make all KERNELVER=$kernelver"
	BUILT_MODULE_NAME[0]="test"
	DEST_MODULE_LOCATION[0]="/updates"
	AUTOINSTALL="yes"

Örnek projemizin yapısı aşağıdaki gibidir:

.. code-block:: c

	test-0.1
	├── Makefile
	├── dkms.conf
	└── test.c

