Ymp komut satırı kullanımı
==========================
Ymp terminal üzerinden komut kullanarak çalıştırarak kullanılır.

.. code-block:: shell

	$ ymp <işlem adı> <parametreler>


Yardım çıktısı alma
^^^^^^^^^^^^^^^^^^^
Tüm ymp işlemlerinin listesine ulaşmak için **ymp help** komutu kullanılır.

.. code-block:: shell

	$ ymp help
	...
	-> install : Install package from source or package file or repository
	...

Örneğin ymp kullanarak `git` paketini yükleyelim. Bunun için `ymp install git` komutunu çalıştırmamız gerekmektedir. Komuta ait parametreleri listelemek için **--help** parametresi eklememiz gereklidir.

.. code-block:: shell

	$ ymp install --help
	-> Aliases:install / it / add
	-> Usage: ymp install [OPTION]... [ARGS]... 
	-> Install package from source or package file or repository
	-> Options:
	->   --ignore-dependency : disable dependency check
	->   --ignore-satisfied : ignore not satisfied packages
	->   --sync-single : sync quarantine after every package installation
	->   --reinstall : reinstall if already installed
	->   --upgrade : upgrade all packages
	->   --no-emerge : use binary packages
	-> Common options:
	->   -- : stop argument parser
	->   --allow-oem : disable oem check
	->   --quiet : disable output
	->   --ignore-warning : disable warning messages
	->   --debug : enable debug output
	->   --verbose : show verbose output
	->   --ask : enable questions
	->   --no-color : disable color output
	->   --no-sysconf : disable sysconf triggers
	->   --sandbox : run ymp actions at sandbox environment
	->   --help : write help messages

Ymp işlemlerinin kısa adları da bulunur. Bu sayede komutu daha kısa şekilde yazıp kullanmamız mümkündür.

.. code-block:: shell

	# Bu ifade ile bir sonraki aynı anlama gelir.
	$ ymp it git
	$ ymp install git

Ymp değişkenleri
^^^^^^^^^^^^^^^^
Ymp çalışırken kendi içerisinde çeşitli değişkenler tanımlar ve bunları kullanarak çalıştırılacak işlemin özelliklerini belirler. Örneğin Ymp paketleri kurarken derleme yapılması istenmiyorsa **no-emerge** değişkeni **true** olarak ayarlanmalıdır. Değişkenler 2 şekilde ayarlanabilir. İlk olarak komut çalıştırılırken parametre eklenebilir.

.. code-block::shell

	# parametre ile değişken tanımlama
	$ ymp it git --no-emerge
	# veya şöyle  da kullanılabilir
	$ ymp it git --no-emerge=true

**Not:** Tanımlanmamış olan tüm değişkenler **false** olarak kabul edilir.

Diğer yol ise **/etc/ymp.yaml** dosyasında ymp bölümüne ekleyebilirsiniz.

Ymp kabuğu
^^^^^^^^^^
Ymp kendi içerisinde komut satırına sahiptir. Bu sayede istenilen işi bir betik dosyasına yazıp çalıştırmanız mümkündür.
Ymp kabuğu başlatmak için **ymp shell** komutu kullanılır.

.. code-block:: shell

	$ ymp shell
	-> Ymp >> install git

Ymp kabugu ymp komutlarını ve parametrelerini kullanarak çalışır. Kabuk üzerinde normal işlemlerin yanında fazladan sadece kabukta çalışan ek işlemler bulunur. Bunlarla ilgili bilgi almak için **ymp help --all** komutu çıktısından yararlanabilirsiniz.

Ymp kabuğu kendi içerisinde basit bir programlama dili yorumlayıcısı barındırır. Bunu kapsamlı bir programlama dili olarak düşünmemekte fayda vardır. Çünkü Bir programlama dilinin sahip olduğu özelliklerin çoğundan mahrumdur ve sadece ymp komutlarının çalıştırılması üzerine tasarlanmıştır.

Açıklama satırları
++++++++++++++++++
**#** ile başlayan satırlar açıklama satırıdır. Bununla birlikte **:** komutu işlevsizdir ve açıklama satırı olarak kullanılabilir.

.. code-block:: shell

	# Bu bir açıklama satırıdır.
	: Bu da bir açıklama satırıdır.

Değişken tanımlama
++++++++++++++++++
Değişken tanımlamak için **set** kullanılır.
**read** komutu ise klavyeden alınan değeri değişken olarak atar.
Bir değişkenin değerini almak için **get** kullanılır.
Değişkenler kullanılırken başlarına **$** işareti konulur.

**Not:** Değişkenlerin herhangi bir karakter kısıtlaması bulunmamaktadır.
Sayı, karakter veya türkçe karakter içerebilirler. (Emoji bile kullanabilirsiniz :D)

Koşul tanımlama
+++++++++++++++
**if** ifadesi ile başlayan satır koşul satırıdır ve **endif** ifadesi gelene kadarki satırlar koşul sağlandığında çalıştırılır.

.. code-block:: shell

	read var
	if eq 12 $var
	    echo sayı 12ye eşit
	endif

Etiket tanımlama
++++++++++++++++
**label** ifadesi ile kabuk betiğinde etiket tanımlanabilir. Daha sonra **goto** ifadesi kullanılarak bu etikete gitmek mümkündür. ymp kabuğunda döngüler bu şekilde sağlanır. Aşağıda siz 0 yazana kadar yazdığınızı ekrana yazan ymp kabuğu betiği mevcuttur.

.. code-block:: shell

	label test
	read var
	if eq $var 0
	    exit
	endif
	echo $var
	goto test


