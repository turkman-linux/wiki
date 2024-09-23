Ymp paket yapımı
================
Ymp paketleri 3 türe ayrılır.

* kaynak paketler
* ikili paketler
* derleme talimatları

Derleme talimatları bizim tarafımızdan yazılan **ympbuild** dosyalarıdır.
Bu dosyalar sayesinde ymp hangi kaynak kodun kullanılacağı, sürüm numarası, adı gibi bilgileri anlayabilir.

**ympbuild** dosyaları aslında birer bash betiğidir. Bu sayede kolay yapılıdır ve bash programlama bilgisi paket yapımı için yeterli olur.

ympbuild dosyası oluşturmak için **ymp template** komutundan yararlanabilirsiniz.
Bu komut size şablon olarak ympbuild dosyası üretir. Bu sayede sadece üzerinde düzenleme yaparak kolayca paket yapabilirsiniz.

Paket formatı
^^^^^^^^^^^^^
Derleme talimatlarından kaynak ve ikili paketler üretmek için **ymp build** komutu kullanılır.
Bu işlem önce kaynak kodu indirir ve doğrular. ardındar istenilen komutlara göre derleme işlemi yapıp paket üretir.

Örnek **ympbuild** dosyası aşağıdaki gibidir

.. code-block:: shell

	#!/usr/bin/env bash
	name=example
	version=1.0
	release=1
	url='https://example.org'
	description='example package'
	email='your-name@example.org'
	maintainer='linuxuser'
	depends=(foo bar)
	source=("https://example.org/source.zip"
	        "some-stuff.patch"
	)
	arch=(x86_64 aarch64)
	sha256sums=('bb91a17fd6c9032c26d0b2b78b50aff5'
	    'SKIP'
	)
	license=('GplV3')
	prepare(){
	    ...
	}
	setup(){
	    ...
	}
	build(){
	    ...
	}
	package(){
	   ...
	}

Burada paketin bilgileri ve nasıl derleneceğini tanımlayan işlevleri görebilirsiniz.

Derleme işlemi ve sandbox
^^^^^^^^^^^^^^^^^^^^^^^^^
Bir ympbuild dosyasını derlemek için aşağıdaki gibi bir komut kullanılmalıdır.

.. code-block:: shell

	$ fdir=./repo/stuff-package/
	$ ymp build "$fdir" --sandbox --shared="$fdir"

Burada ilk önce paketin derleneceği dizini değişkene atadık. Paket derlenirken **sandbox** özelliğini açmak için **--sandbox** parametresi ekledik ve sandbox içerisine paketin derleneceği dizini erişilebilir hale getirmek için **--shared** parametresine dizinin konumunu yerleştirdik.

Bu komut sandbox olmadan şu şekilde görünürdü.

.. code-block:: shell

	$ ymp build ./repo/stuff-package/

Burada sandbox zorunlu değildir fakat paketlerin düzgünce derlenmesi için kullanmanızı şiddetle öneririm.

ympbuild
^^^^^^^^

Değişkenler
+++++++++++

* **name** : Paketin adını belirtir.
* **version** : Paket sürümünü belirtir.
* **release** : Paket numarasını belirtir. Ymp güncellik kontrolü için sadece bu değere bakar.
* **url** : Paketin anasayfasını belirtir. Bu değer kullanılmaz.
* **description** : Paket açıklamasını belirtir.
* **email** : Paketçinin email adresidir.
* **maintainer** : Paket bakımcısının adıdır. (veya nickname)

Not: ymp derleme işleminin ardından paket boyutunu azaltmak için **strip** işlemini otomatik olarak uygulamaktadır. Bu durum bazı paketlerin bozulmasına sebep olabilir. Bunu engellemek için **dontstrip** değişkeni tanımlayarak bir değer atayabilirsiniz.


Diziler
+++++++
* **depends** : Paket bağımlılıklarını belirtir
* **source** : Paket kaynak kodları listesini belirtir
* **sha256sums** : Paket sha256sum değeri listesidir. **SKIP** olan elemanları görmezden gelinir.
* **uses** ve **uses_extra** : use flag listesidir.
* **arch** : Desteklenen mimari listesidir.

İşlevler
++++++++
* **prepare** : Hazırlık aşamasıdır. Burada kaynak kod yamaları uygulanır.
* **setup** : Kaynak kod yapılandırma aşamasıdır.
* **build** : Kodun derlendiği aşama burasıdır.
* **package** : Kaynak kodun paketleme dizinine kurulduğu aşamadır.

Derleme dizinleri
^^^^^^^^^^^^^^^^^
Her derlemenin **/tmp/ymp-build/<build-id>** içinde kendi derleme dizini vardır.
build-id aslında ympbuild dosyasının md5sum'udur, bu nedenle ympbuild'i değiştirirseniz build-id değişir.
Derleme dizini **HOME** çevresel değişkeni oarak tanımlanır. Bu sayede sadece **cd** komutunu kullanarak derleme dizinine geri dönebilirsiniz.

Derlenen kaynak kodlar paketlenirken **/tmp/ymp-build/<build-id>/output** dizinine kurulmalıdır. Bu dizin **installdir** ve **DESTDIR** çevresel değişkeni ile tanımlanır.
Bu sayede **make install** gibi komutlara herhangi bir ek parametre vermenize gerek kalmaz.

**Not:** /tmp dizini genellikle ramdisk olarak bağlı olduğu için derleme sırasında ram dolabilir. Bunu engellemek için aşağıdaki gibi bir komut kullanabilirsiniz.

.. code-block:: shell

	$ rm -rf /tmp/ymp-build
	$ mkdir /home/linuxuser/ymp-build
	# Bunu sistemi her başlattığınızda tekrarlamanız gerekebilir.
	$ ln -s /home/linuxuser/ymp-build /tmp/ymp-build

Use flag kavramı
^^^^^^^^^^^^^^^^
Paketlerde özellik tanımları yapmak için **uses** ve **uses_extra** dizileri tanımlayabilirsiniz.
Bu özellikler isteğe bağlı açılıp kapatılabilirler.
Bu sayede isteyenler paketleri istedikleri özelliklerle kullanabilirler.

.. code-block:: shell

	...
	uses=(foo bar)
	uses_extra=(bazz)
	foo_depends=(foo bazz)
	...
	setup(){
	    ../configure --prefix=/usr \
	    $(use_opt foo --with-foo --without-foo)
	}
	...
	package(){
	    ...
	    if use bar ; then
	        install stuff ${DESTDIR}/bin/stuff
	    fi
	}

Bağımlılıklar
+++++++++++++
Tanımlanan her özellik için **xxx_depends** şeklinde dizi tanımlayarak o özelliğin ek bağımlılıkları belirtilebilir.
Bu sayede özelliği açtığımızda hangi ek paketlere ihtiyaç duyduğumuzu anlamamız mümkün olur.

İşlevler
++++++++
Burada **use_opt** özelliğin açık olup olmama durumuna göre çalışır. Kullanımı şu şekildedir:

.. code-block:: shell

	use_opt <özellik> <açık-olma-durumu> <kapalı-olma-durumu>

**use** ise yine özelliğin açık olup olmama durumunu belirtir fakat karşılığında çıktı üretmek yerine **if** ile kullanılır.
Kullanımı şu şekildedir:

.. code-block:: shell

	if use <özellik> ; then
	    <açık-olma-durumu>
	else
	    <kapalı-olma-durumu>
	fi

Özellik açma
++++++++++++

Özellikler **USE** çevresel değişkeni ile veya **--use** parametresi veya ayar dosyasında belirtilir.

.. code-block:: shell

	# --use=xxx yöntemi
	$ ymp build ./repo/stuff-package --use="foo bar"
	# USE=xxx yöntemi
	$ USE="foo bar" ymp build ./repo/stuff-package

Eğer özellik listesi olarak **all** belirtirseniz **uses** dizisindeki tüm özellikler, **extra** belirtirseniz ise **uses_extra** dizisinin tümü kullanılır.

**Not:** Use flag sadece kaynak paketler ve derleme talimatlaı için kullanılabilir.

**Not:** sistemimizin mimarisi ile aynı adda use flag otomatik olarak tanımlanır ve kullanılır.
Bu sayede tek bir ympbuild dosyası ile birden çok mimariye uyumlu paket üretilebilir.

Git tabanlı paketler
^^^^^^^^^^^^^^^^^^^^
Ymp paket deposu dışında bir git deposunu kullanarak paketler oluşturmanıza izin verir. Bu sayede bir paketi depoya bağlı kalmadan paylaşabilirsiniz.

Bunun için öncelikle **ymp template** kullanarak ympbuild dosyamızı oluşturalım. Ardından oluşturduğumuz dizini git deposu haline getirelim.

.. code-block:: shell

	$ ymp template --name=example --output=test-package ...
	$ cd test-package 
	$ git init

Git adresimizi ekleyelim ve commit oluşturup gönderelim.

.. code-block:: shell

	$ git remote add origin git@example.org:yourname/test-package.git
	$ git commit -m "first commit"
	$ git push -u origin master

Not: **ympbuild** dosyamız git deposunun ana dizininde bulunmalıdır.

Paketi aşağıdaki gibi derleyebiliriz. 

.. code-block:: shell

	$ ymp build --output=/path/to/output git@example.org:yourname/test-package.git

Not: git tabanlı paketler güvenilir olmayan paket olarak işaretlenir. Yüklemek için **--unsafe** parametresi kullanmanız gerekebilir.
