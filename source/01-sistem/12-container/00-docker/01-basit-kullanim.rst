Basit kullanım
==============
**docker run** komutu, Docker'da yeni bir container başlatmak ve çalıştırmak için kullanılır.
Bu komut, bir Docker imajını temel alarak bir container başlatır ve bu containeri belirli ayarlarla çalıştırmanızı sağlar.

İşte docker run komutunun temel kullanımı ve bazı yaygın seçenekler:

.. code-block:: shell

	docker run [OPTIONS] IMAGE [COMMAND] [ARG...]
	
	    OPTIONS: Docker containerinin çalıştırılması sırasında kullanılan seçenekleri belirtir.
	    IMAGE: Başlatılacak containerin temel alınacak Docker imajının adını veya ID'sini belirtir.
	    COMMAND: containerin içinde çalıştırılacak komutu belirtir (isteğe bağlı).
	    ARG: Komutun argümanlarını belirtir (isteğe bağlı).

Örnekler:

    Basit bir imajı çalıştırma:

.. code-block:: shell

	$ docker run debian

Bu komut, resmi debian imajını kullanarak yeni bir container başlatır.

Bağlantılı bir portu ayarlama:

.. code-block:: shell

	$ docker run -p 8080:80 nginx

Bu komut, Docker host'unun 8080 portunu, containerin 80 portuna yönlendirir.

Arkaplanda çalıştırma ve isimlendirme:

.. code-block:: shell

	$ docker run -d --name my-container nginx

Bu komut, my-container adında bir containeri arkaplanda çalıştırır.

containeri belirli bir komutla çalıştırma:

.. code-block:: shell

	$ docker run debian ls -l

Bu komut, debian imajını temel alarak ls -l komutunu çalıştırır ve ardından containeri kapatır.

Ana bilgisayarın dosya sistemini bir containerle paylaşma:

.. code-block:: shell

	$ docker run -v /host/path:/container/path debian

Bu komut, ana bilgisayarın belirli bir dizinini (/host/path) containerin belirli bir diziniyle (/container/path) paylaşır.

Çevre değişkenleri tanımlama:

.. code-block:: shell

	$ docker run -e MY_VARIABLE=my_value debian

Bu komut, MY_VARIABLE adında bir çevre değişkenini my_value değeriyle tanımlar.

İçindeki bir bağlamı kullanarak çalıştırma:

.. code-block:: shell

	$ docker run -it debian /bin/bash

Bu komut, interaktif modda (-it) debian imajını başlatır ve /bin/bash komutunu çalıştırarak kullanıcıyı containerin içine sokar.

Çalışan containerleri görmek
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
**docker ps** komutu, çalışan Docker containerlerini listelemek için kullanılır.
Bu komut, çalışan containerlerin temel bilgilerini, ID'lerini, isimlerini, başlatıldığı zamanı ve hangi portların bağlandığını gösterir.

İşte docker ps komutunun temel kullanımı ve bazı yaygın seçenekleri:

.. code-block:: shell

	$ docker ps [OPTIONS]
	# OPTIONS: Docker containerlerini listelerken kullanılacak seçenekleri belirtir.


Örnekler:

Tüm çalışan containerleri listeleme:

.. code-block:: shell

	$ docker ps

Bu komut, şu anda çalışan tüm Docker containerlerini listeler.

Tüm containerleri (çalışan ve durmuş) listeleme:

.. code-block:: shell

	$ docker ps -a

Bu komut, şu anda çalışan ve durmuş olan tüm Docker containerlerini listeler.

Açık olan containeri kapatmak ve silmek
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Açık olan bir Docker containerini kapatmak için **docker stop** komutunu kullanabilirsiniz.
İşte basit bir kullanım örneği:

.. code-block:: shell

	$ docker stop CONTAINER_ID

Burada **CONTAINER_ID**, durdurmak istediğiniz Docker containerinin kimliğidir.
Alternatif olarak, Docker containerine bir isim verdiyseniz, ismi kullanabilirsiniz.

Örneğin:

.. code-block:: shell

	$ docker stop my-container

Eğer çalışan tüm Docker containerlerini durdurmak istiyorsanız, aşağıdaki komutu kullanabilirsiniz:

.. code-block:: shell

	$ docker stop $(docker ps -q)

Bu komut, **docker ps -q** komutu ile tüm çalışan containerlerin ID'lerini alır ve ardından bu ID'leri kullanarak **docker stop** komutunu uygular.

Containeri durdurduktan sonra, container hala sistemde bulunur ancak çalışmaz durumda olur.
Containeri tamamen kaldırmak için **docker rm** komutunu kullanabilirsiniz. Örneğin:

.. code-block:: shell

	$ docker rm CONTAINER_ID
	# veya
	$ docker rm my-container

Eğer çalışan tüm containerleri durdurup ardından kaldırmak istiyorsanız, aşağıdaki komutu kullanabilirsiniz:

.. code-block:: shell

	docker rm $(docker ps -a -q)

Bu komut, tüm containerlerin kimliklerini alır ve ardından bu kimlikleri kullanarak **docker rm** komutunu uygular.


Durdurulmuş bir containeri başlatmak ve içine girmek
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
**docker start** ve **docker attach** komutları, Docker containerleri üzerinde çalışma ve etkileşim kurma işlemleri için kullanılır.

**docker start** komutu, durmuş olan bir Docker containerini başlatmak için kullanılır.

İşte temel kullanımı:

.. code-block:: shell

	$ docker start CONTAINER_ID
	# veya
	$ docker start CONTAINER_NAME
	# CONTAINER_ID veya CONTAINER_NAME, başlatmak istediğiniz Docker containerinin ID'si veya adıdır.

Örnek:

.. code-block:: shell

	docker start my-container

Bu komut, **my-container** adlı bir Docker containerini başlatır.
Başlatılan bir container, **docker ps** komutu ile görülebilir.

**docker attach** komutu, çalışan bir Docker containerine bağlanmak için kullanılır.
Bu komut, containerin ana sürecine doğrudan bir terminal bağlantısı sağlar. İşte temel kullanımı:

.. code-block:: shell

	$ docker attach CONTAINER_ID
	# veya
	$ docker attach CONTAINER_NAME
	# CONTAINER_ID veya CONTAINER_NAME, bağlanmak istediğiniz Docker containerinin ID'si veya adıdır.

Örnek:

.. code-block:: shell

	$ docker attach my-container

Bu komut, my-container adlı bir Docker containerine bağlanır.
Bu komutu kullanarak, containerde çalışan bir sürecin çıktısını görebilir ve klavyeden giriş yapabilirsiniz.

