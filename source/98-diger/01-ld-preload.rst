LD_PRELOAD
==========

Bir uygulamada bulunan bir fonksiyonu **LD_PRELOAD** yazarak değiştirebiliriz. Bunun için aşağıdaki gibi bir C kodumuz olsun.

.. code-block:: C

    #include <stdio.h>

    int test(char* msg){
        puts(msg);
        return 0;
    }

    void main(){
        return test("Hello World");
    }

Bu dosyayı derleyelim.

.. code-block:: shell

    gcc -o main main.c

Buradaki değiştirmek istediğimiz test fonksiyonunu aşağıdaki gibi ayrı bir dosyaya yazalım.

.. code-block:: C

    #include <stdio.h>

    int test(char* mgs){
        puts("Hmmm");
        return 1;
    }


Bu dosyayı **shared** olarak derleyelim.

.. code-block:: shell

    gcc test.c -o test.so -shared

**main** dosyamızı aşağıdaki gibi çağırlırsak değiştirmek istediğimiz fonksiyon çalışır.

.. code-block:: shell

    LD_PRELOAD=$PWD/test.so ./main

Eğer değiştirdiğimiz fonksiyona ihtiyacımız varsa aşağıdaki gibi kullanarak elde edebiliriz.

.. code-block:: C

    #include <stdio.h>
    #include <dlfcn.h> /* dlsym için */

    int test(char* mgs){
        int (*orig)(char*) = dlsym(RTLD_NEXT, "test");
        int status = orig("HmmmV2");
        return status+2;
    }

Yukarıdaki gibi yaparak asıl fonksiyona **orig** adı ile erişebiliriz.

**Not:** Türkmen linuxta güvenlik gereği bu çevreler değişken görmezden gelinir. bunun yerine dosya konumunu **/etc/ld.so.preload** içine yazmalısınız.
