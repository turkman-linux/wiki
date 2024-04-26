Linux dağıtımı nedir
^^^^^^^^^^^^^^^^^^^^
**Linux dağıtımı** (GNU/Linux) linux çekirdeğini kullanan ve GNU araç setini barındıran bir işletim sistemidir.
Buna dağıtım denmesinin sebebi özgür yazılım olması ve isteyenlerin istediği gibi düzenleme ve dağıtma yetkisinin bulunmasıdır.

**Taban** kavramı ise bir gnu/linux dağıtımının kullandığı temel uygulama ve ayarların standartlarıdır.
Örneğin debian tabanı paket sistemi olarak apt kullanır.
glibc kütüphanesini kullanır ve sabit sürümlüdür (fixed release) ve uzun süreli destek (LTS) yapısına göre geliştirilir.
Alpine tabanı ise glibc yerine musl kullanır. Yuvarlanan sürümlüdür (rolling release).

Dağıtımların kendine ait tabanı bulunabilir veya başka bir dağıtımın tabanını kullanabilir.


Sabit sürüm ve yuvarlanan sürüm
+++++++++++++++++++++++++++++++
Sabit sürümlü dağıtımlarda paketler belli aralıklarla toplu olarak güncelleme alırlar. Genellikle daha kararlıdırlar fakat daha yavaş güncelleme alırlar.
Sabit sürümlü dağıtımlara örnek olarak **debian** ve türevleri örnek gösterilebilir.

Yuvarlanan sürümlü dağıtımlar ise sürekli olarak güncelleme alırlar ve herhangi bir sürüm numarasına sahip değillerdir. Bu daha az kararlı olmasına sebep olabilirken daha güncel bir sistem sağlayabilir.
Yuvarlanan sürümlü dağıtımlara örnek olarak **archlinux** gösterilebilir.

Bağımsız tabanlı dağıtım tasarlamak için yuvarlanan sürümlü dağıtım tasarlamak daha basittir ve daha az uğraş gerektirir.

Uzun süreli destek (LTS)
++++++++++++++++++++++++
Bazı gnu/linux dağıtımları üzün süreli desteğe sahiptirler. Uzun süreli desteğe sahip sistemler daha kararlıdır fakat genellikle eski paketler içerirler. 
Genellikle sık güncelleme yapılması istenmeyen alanlarda veya kararlılığın önemli olduğu alanlarda tercih edilir. Yuvarlanan sürümlü dağıtımların uzun süreli desteği bulunmaz.
Uzun süreli destek özelliğine sahip olan uygulama ve sistemlerde bulunan güvenlik açıkları ve hatalar güncel sürümden uyarlama yolu ile eklenir. (backports)
Bu uyarlamalar sayesinde açıklar ve eksikler olmadan sistem sorunsuz bir şekilde çalıştırılabilir.

**Yazar notu:** Bana sorarsanız LTS kullanmayın :D

Linux dağıtımının temel yapısı
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Bir linux dağıtımını oluşturan tüm parçalar paketlerden oluşur. Bu bölüm linux dağıtımının temel yapısı ve paket sistemi ile ilişkisi anlatılacaktır.

Sıradan bir linux dağıtımını 4 temel parçada ele alabiliriz.

1. Kernel (Linux)
------------------

Kernel, bir Linux dağıtımının en temel bileşenidir. Donanım kaynaklarını yönetir, sürücüleri yükler, sistem çağrılarını işler ve diğer yazılım bileşenleriyle etkileşim kurar. Linux kerneli, genellikle dağıtım geliştiricileri tarafından özelleştirilir ve optimize edilir. Yeni sürümler, performans iyileştirmeleri, güvenlik yamaları ve donanım uyumluluğu gibi çeşitli iyileştirmeler içerebilir.

2. Initramfs
------------

Initramfs (initial RAM filesystem), sistem başlatma işlemi sırasında kullanılan geçici bir dosya sistemidir. Initramfs, ana dosya sistemine erişim sağlamadan önce gerekli sürücüleri yükler ve sistem başlatma sürecini tamamlar. Bu, özellikle karmaşık donanım yapılandırmalarına sahip sistemlerde, önyükleme sırasında gerekli olan sürücülerin doğru şekilde yüklenmesini sağlar.

3. Servis Yöneticisi
---------------------

Servis yöneticisi, sistemde çalışan hizmetlerin yönetiminden sorumludur. Bu hizmetler genellikle sistem başlatıldığında otomatik olarak başlatılır ve gerektiğinde durdurulur. Servis yöneticisi ayrıca hizmetlerin bağımlılıklarını yönetir, bu da sistem performansını ve güvenilirliğini artırır. Linux dağıtımlarında yaygın olarak kullanılan servis yöneticileri arasında systemd, OpenRC, SysVinit ve Upstart bulunmaktadır.

4. Masaüstü Ortamı
-------------------

Masaüstü ortamı, kullanıcı arabirimini sağlar ve kullanıcıların sistemle etkileşimde bulunmasını sağlar. Bu, pencere yönetimi, dosya yönetimi, uygulama başlatma ve sistem ayarlarını yapılandırma gibi görevleri içerir. Linux dünyasında birçok farklı masaüstü ortamı bulunmaktadır, bunlar arasında GNOME, KDE Plasma, Xfce, LXQt, Cinnamon, MATE ve daha fazlası yer almaktadır.

Paket Sistemi ile İlişki
^^^^^^^^^^^^^^^^^^^^^^^^

Linux dağıtımlarındaki temel parçaların çoğu, paketler şeklinde dağıtılır ve yönetilir. Paketler, yazılımın kurulumunu, güncellemesini ve kaldırılmasını kolaylaştıran birimlerdir. Bir Linux dağıtımı, genellikle bir paket yöneticisi aracılığıyla paketleri arar, yükler, günceller ve kaldırır. Paket yöneticisi, paket bağımlılıklarını yönetir ve çatallanma, güvenlik güncellemeleri ve yazılım dağıtımı gibi işlemleri kolaylaştırır.

Örneğin, Debian tabanlı dağıtımlarda (örneğin, Ubuntu), apt (Advanced Package Tool) paket yöneticisi kullanılırken, Red Hat tabanlı dağıtımlarda (örneğin, Fedora), yum (Yellowdog Updater Modified) veya daha yeni dağıtımlarda dnf (Dandified Yum) kullanılabilir.

