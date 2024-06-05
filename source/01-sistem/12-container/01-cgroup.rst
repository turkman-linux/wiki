Cgroup
======
**Cgroup** çalışan süreçleri guruplamak ve kontrol etmek için kullanılır.
Bu sayede belli işlemleri kısıtlayabilir veya toplu şekilde yöneteilirsiniz.

Cgroup linux çekirdeğinin bir özelliğidir. Bir çok iş için kullanılabilir.
Örneğin servis yöneticisi servisleri çalıştırıp daha sonra sonlandırmak için cgroup kullanır.


Cgroup oluşturma
^^^^^^^^^^^^^^^^
Öncelikle cgroup dizininin bağlandığından emin olun.

.. code-block:: shell

	mount | grep /sys/fs/cgroup type
	>> none on /sys/fs/cgroup type cgroup2 (rw,nosuid,nodev,noexec,relatime,nsdelegate)


Eğer bağlı değilse aşağıdaki gibi bağlayabilirsiniz:

.. code-block:: shell

	mount -t cgroup2 none /sys/fs/cgroup

Bir cgroup oluştumak için bu dizine bir alt dizin oluşturmalıyız.
Çekirdeğimiz bizim için cgroup oluşturacakdır.

.. code-block:: shell

	mkdir /sys/fs/group/deneme


Süreç ekleme
^^^^^^^^^^^^
Bir gurubun içerisine aşyağıdaki gibi bir süreç ekleyebilirsiniz.

.. code-block:: shell

	# örneğin pid değerimiz 1234 olsun
	echo 1234 > /sys/fs/cgroup/deneme/cgroup.procs

**Not:** eklediğimiz sürecin tüm alt süreçleri de bu guruba dahil olacakdır.

Aynı şekilde cgroup içindeki süreçlerin pid değerlerinin listesini öğrenebiliriz.

.. code-block:: shell

	cat /sys/fs/cgroup/deneme/cgroup.procs
	>> 1234

Cgroup silme
^^^^^^^^^^^^
Öncelikle cgroup içerisindeki tüm süreçleri kapatalım.

.. code-block:: shell

	echo 1 > /sys/fs/cgroup/deneme/cgroup.kill

Ardından dizinimizi silelim

.. code-block:: shell

	rmdir /sys/fs/cgroup/deneme/

