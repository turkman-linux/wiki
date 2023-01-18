Kullanıcı yönetimi
==================
Her kullanıcının kendisine ait bir uid ve gid değeri bulunur.
Bu değer sistem kullanıcıları için 1000 den küçük normal kullanıcılar için ise 1000 ve daha büyük bir değere sahiptir.

**Not:** **uid** değeri 0 ise kullanıcı tam yetkilidir. (root yetkisi)

Bu uid değerleri **/etc/passwd** dosyası içerisinde bulunur.

.. code-block:: shell

	root:x:0:0:root:/root:/bin/ash
	pingu:x:1000:1000:Linux User:/home/pingu:/bin/bash
	# pingu : kullanıcı adı
	# x : bir anlamı yok
	# 1000 : uid değeri
	# 1000 : gid değeri
	# Linux User : kullanıcının gözüken adı
	# /home/pingu : kullanıcı ev dizini
	# /bin/bash : kullanıcı kabuğu

**Not:** Sulix diğer dağıtımlardan farklı olarak **/home** yerine **/data/user** dizini kullanır.
Bu yüzden kullancı ev dizinini uygun olarak ayarlamanız gerekir.

Kullanıcı ekleme ve silme
^^^^^^^^^^^^^^^^^^^^^^^^^
Kullanıcı ekleme
++++++++++++++++
Yeni kullanıcı eklemek için **useradd** veya **adduser** komutu kullanılır.

.. code-block:: shell

	$ useradd -d /data/user/pingu -m -u 1000 -g 1000 -s /bin/bash pingu
	# -d ev dizini
	# -m ev dizini oluşturmak için (yoksa)
	# -u uid değeri
	# -g gid değeri
	# -s varsayılan kabuk
	$ adduser -D -h /data/user/pingu -u 1000 -s /bin/bash pingu
	# -D oluştururken kullanıcı parolası sormaması için
	# -h ev dizini konumu
	# -u uid değeri
	# -s varsayılan kabuk
	$ echo "pingu:x:1000:1000:Linux User:/data/user/pingu:/bin/bash" >> /etc/passwd
	$ mkdir -p /data/user/pingu
	$ chown pingu /data/user/pingu
	# Bu şekilde de kullanıcı ekleyebilirsiniz fakat tavsiye edilmez.

Sysconf yardımı ile kullanıcı ekleme
************************************
Sulix içerisinde **/etc/passwd.d** dizini bulunur.
Bu dizin sayesinde paketler kurulurken kullanıcı eklemek mümkün olur.
Bunun için **/etc/passwd.d/paketadı** dosyası oluşturup içerisine passwd dosyasına eklenmesi gereken satırlar yazılabilir.
Bu sayede paket kurulurken sysconf bu dosyayı algılayarak kullanıcıyı otomatik olarak sisteme dahil eder.

Kullanıcı silme
+++++++++++++++
Kullanıcı silmek için **userdel** veya **deluser** komutu kullanılır.

.. code-block:: shell

	$ userdel -r pingu
	# -r ev dizinini silmek için
	$ deluser --remove-home pingu
	# --remove-home ev dizinini silmek için
	$ sed -i "/^pingu:x:.*/d" /etc/passwd
	$ rm -rf /data/user/pingu
	# Bu şekilde de kullanıcı silebilirsiniz fakat tavsiye edilmez.

Parola ayarlama
^^^^^^^^^^^^^^^
Kullanıcılar arası geçiş yapmak için **su** komutu kullanılır.
Bu komut geçilecek olan kullanıcının parolasını sorar.
Bu yüzden kullanıcılara bir parola tanımlamamız gerekmektedir.

Parola tanımlamak için **passwd** komutu kullanılır.

.. code-block:: shell

	$ passwd pingu
	# kullanıcı adı belirtmezseniz root kabul edilir.

Parola ayarlamanın diğer bir yolu ise **usermod** komutu kullanmaktır.
Bu yöntemde **openssl** komutundan yararlanılır.

.. code-block:: shell

	# önce hash elde edelim
	$ openssl passwd -6 'parola'
	-> $6$GBPcPGqQLyLcYkKl$1z5BOQB36E31.VIJyGJXwCc6invR2WgeaSI9Jz7QZU/QZbffEm.J8edQkyIBtRWpSa.VFob3p/BH84Unag1Y60
	# -6 sha512 formatında hash üretmek için.
	# elde ettiğimiz değer ile parola beirleyelim.
	$ usermod -p <hash-değeri> pingu
	# Şu şekilde de tanımlayabilirsiniz.
	$ usermod -p "$(openssl passwd -6 'parola')" pingu

**Not:** Özel karakterler ile parola oluşturma durumuna karşı tek tıknak (**'**) işareti içerisine yazmanız gerekmektedir.

**Not:** Parolanın kabuğun history bölümünde gözükmesi güvenlik sorunlarına sebep olabilir.
İşlem bittikten sonra history dosyasını temizlemenizi öneririm.
