Musl libc
^^^^^^^^^
Musl hafif ve minimal yapılı bir **libc** alternatifidir.

Kurulum
+++++++
Türkmen linuxa yüklemek için aşağıdaki komutu kullanabilirsiniz:

.. code-block:: shell

	$ ymp install musl

Kaynak koddan derleyip yüklemek için ise öncelikle aşağıdaki gibi bir yol izleyebilirsiniz:

.. code-block:: shell

	# kaynak kodu aşağıdaki gibi derleyip yükleyebiliriz.
	$ ./configure --prefix=/usr
	$ make
	$ make install


**Not:** Eğer sisteme yüklemek istemiyorsanız **--prefix** parametresini kullanıcınıza ait bir dizin ile değiştirmeniz yeterlidir.

Kullanımı
+++++++++
Musl libc kulanarak kaynak kod derlemek için **musl-gcc** komutu kullanılır.

Örneğin basit bir C kodu yazalım ve derleyelim:

.. code-block:: c

	#include <stdio.h>
	int main(){
	    puts("Hello World");
	}

Şimdi bu kodu **musl-gcc** ile derleyelim.

.. code-block:: shell

	$ musl-gcc -o main main.c


**Meson** **Cmake** veya **Autotools** gibi araçlar ile musl kullanmak isterseniz **CC** değişkeni ayarlamanız gerekmektedir:

.. code-block:: shell

	$ export CC=musl-gcc

Şimdi derlenmiş olan koda **musl-ldd** ile bakalım:

.. code-block:: shell

	$ musl-ldd main
	    /lib64/ld-musl-x86_64.so.1 (0x7f6a9cfc4000)
	    libc.so => /lib64/ld-musl-x86_64.so.1 (0x7f6a9cfc4000)

Burada dikkat etmemiz gereken eğer **glibc** tarafından gelen **ldd** komutunu kullanırsak şuna benzer bir hata ile karşılaşırdık:

.. code-block:: shell

	$ ldd main
	./main: error while loading shared libraries: /lib64/libc.so: invalid ELF header

Çalıştırılması
++++++++++++++
Musl libc ile derlenmiş bir kaynak kod **interpreter** ve **libc.so** dosyasına ihtiyaç duyar. Bu iki dosya musl libc için aslında aynı dosyadır.
Kodu eğer musl libc sistemde yüklü ise doğrudan çalıştırabilirsiniz.

.. code-block:: shell

	./main

Eğer sisteminizde kurulu değilse aşağıdaki gibi bir yolu kullanmanız gerekebilir.

.. code-block:: shell

	LD_LIBRARY_PATH=/musl/libc/path /musl/libc/path/lib/ld-musl-x86_64.so.1 ./main

**Not:** musl libc ile derlenmiş bir kod glibc ile derlenmiş kütüphaneleri kullanamaz.
Aynı şekilde glibc ile derlenmiş kod musl libc ile derlenmiş kütüphaneleri kullanamaz.

