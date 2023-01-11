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

Diğre yol ise **/etc/ymp.yaml** dosyasında ymp bölümüne ekleyebilirsiniz.

..code-block::shell

	ymp:
	   ...
	   no-emerge: true
	   ...

