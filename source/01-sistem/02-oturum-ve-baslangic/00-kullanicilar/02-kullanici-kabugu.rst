Kullanıcı Kabuğu
================
Kullanıcı oturum açtığı anda kullanıcının varsayılan kabuk uygulaması (shell) başlatılır.

Bu varsayılan kobuk konumu **/etc/passwd** dosyasında belirtilmiştir.

.. code-block:: shell

	pingu:x:1000:1000::/data/user/pingu:/bin/ash

Burada **/bin/ash** kabuk konumudur.

Kabuğu değiştirme
^^^^^^^^^^^^^^^^^
Öncelikle değiştirmek istediğiniz kabuğun konumunu **/etc/shells** içerisine eklemeniz gerekmektedir.
Bu işlemi yapmazsanız kullanıcıyla giriş yapamazsınız.

Daha sonra **/etc/passwd** dosyasından kabuğun konumunu değiştirmemiz gerekir.

**Not:** Kabuk konumu parametre alamaz ve tam konum olmak zorundardır.

Kabuk değiştirildikten sonra tekrar giriş yapmanız gerekebilir.

Eğer kabuk konumu olarak **/sbin/nologin** kullanırsanız kullanıcının giriş yapmasını engellemiş olursunuz.
Bu genellikle servislerin oluşturduğu kullanıcılar için kullanılır.

Unix Kabuğu
^^^^^^^^^^^
/bin/sh sistem tarafından kullanılan genel kabuktur.
Bu kabuk debian tabanlılar için **/bin/dash**, alpine linux ve türkmen linux için **/bin/busybox**, diğerleri için **/bin/bash** konumuna sembolik bağlıdır.

Bu kabuk sistem açılırken kullanılır. Aşağıdaki gibi bir C kodu ile durumu örnekleyebiliriz.

.. code-block:: C

	#include <stdio.h>
	int main(){
	    system("echo $0");
	    return 0;
	}

Bu kod çalıştırıldığında ekrana **sh** yazacakdır. Çünkü system komutu şununla eşdeğer şekilde çalışır.

.. code-block:: shell

	execl("/bin/sh", "sh", "-c", command, (char *) NULL);

Bu yüzden /bin/sh kabuğunu iyi seçmek sistem tasarımı açısından önemli olabilir. Farklı unix kabukları ve avantaj/dezavantajları aşağıdaki gibi özetlenebilir.

* /bin/dash : Debian tarafandan geliştirilir. Sadece kullanıcılar tarafından fakat yazılımlar tarafından ihtiyaç duyulmayan ek özellikler bulunmaz. (Tab tuşu ile tamamlama gibi). Bu sayede küçük boyutludur ve hızlı çalışır. Bash uyumlu değildir.

* /bin/ash : Busybox tarafından sağlanır. Ek pakete gereksinim duymaz. Basit seviyede özelliklere sahiptir. Kısmen bash uyumludur.

* /bin/bash : Bash GNU/Linux dağıtımlarının genelinde varsayılandır ve Çok az sorun çıkarır.


Unix kabuğunu değiştirmek için ayağıdaki gibi bir yol izleyebilirsiniz.

.. code-block:: shell

	$ rm -f /bin/sh
	$ ln -s bash /bin/sh

