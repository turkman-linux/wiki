Kullanıcılar arası geçiş
========================
Root yetkisi
^^^^^^^^^^^^
Root yetkisi sistemde tam erişime sahip yetki düzeyidir.
Bu yetki sayesinde sistemde değişiklik yapılabilmektedir. Örneğin paket kurulumu ve kaldırma gibi işlemler için root yetkisine ihtiyacımız vardır.

Root yetkisi **root** kullanıcısına aittir. Bu kullanıcının **UID** ve **GID** değeri 0dır. Ev dizini ise **/root** dizinidir.

Root yetkisinin alınması
++++++++++++++++++++++++
Kullanıcı değiştirmek için **su** komutu kullanılır. Eğer bu komuta parametre vermezseniz **root** kullanıcısına geçiş yapılmış olur.

.. code-block:: shell

	$ su
	-> Password:
	$ id
	-> uid=0(root) gid=0(root) groups=0(root)...

suid kavramı
^^^^^^^^^^^^
**su** komutunun çalışabilmesi için **suid** iznine sahip olması gereklidir. Bunu aşağıdaki gibi kontrol edebiliriz.

.. code-block:: shell

	# s harfi suid iznini ifade eder.
	$ ls -la /bin/su
	-> -rws--x--x 1 root root 72816 Jan 14 10:25 /bin/su

**suid** izni vermek için **chmod u+s** izni geri almak için ise **chmod u-s** komutu kullanılır. Bu komutlar sadece root kullanıcısı tarafından çalıştırılabilir.

.. code-block:: shell

	# yetki vermek için
	$ chmod u+s /bin/su
	# yetkiyi geri almak için
	$ chmod u-s /bin/su

setuid sistem çağrısı
+++++++++++++++++++++
**suid** izni verilen dosyalar **setuid()** ve **setgid()** sistem çağrısını kullanabilirler. Örneğin aşağıdaki gibi bir C kodumuz olsun.

.. code-block:: C

	#include <unistd.h>
	#include <stdlib.h>
	int main(){
	    setuid(0);
	    setenv("USER","root",1);
	    return system("sh");
	}

Bu C kodunu gcc ile derleyelim ve **suid** izni verelim. **suid** yalnızca root kullanıcısı ayarlayabileceği için bu işlem root kullanıcısı ile yapılmalıdır.

.. code-block:: shell

	$ gcc -o main.c main
	$ chmod u+s main

Derlenen ve **suid** izni ayarlanan dosyamızı normal kullanıcımız ile çalıştırdığımızda root yetkisi alacaktır.
**su** komutumuz bundan yararlanarak çalışmaktadır.

**Not:** suid iznine sahip dosyalar potansiyel güvenlik açığı oluşturabilir.

suid engelleme
++++++++++++++

Dosya sisteminde **suid** iznini engellemek için **nosuid** seçeneği etkinleştirilebilir. **/etc/fstab** dosyamızda ilgisi satır şu şekilde olabilir.

.. code-block:: shell

	...
	# filesystem     mountpoint   type   options           dump/pass
	/dev/nvme0n1p2   /            ext4   default,rw,nosuid 0 0
	...

busybox su
^^^^^^^^^^
Busybox bize **su** komutu sağlayabilmektedir. Bu komutu kullanmak için öncelikle busyboxun kopyası oluşturulmalı ve ona **suid** yetkisi verilmelidir. Türkmen varsayılan su komutu olarak busyboxu kullanmaktadır.

.. code-block:: shell

	$ install /bin/busybox /bin/su
	$ chmod u+s /bin/su


