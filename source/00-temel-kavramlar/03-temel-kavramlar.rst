Linux'a başlarken sıkça karşılaşabileceğiniz temel kavramlar:

* **ACPI** (Advanced Configuration and Power Interface), bilgisayar donanımının yönetimini sağlayan bir endüstri standardıdır ve enerji tüketimini optimize etmek için kullanılır.

* **Ağ Aygıtları ve Arayüzler** (Network Devices and Interfaces): Ethernet kartları, kablosuz adaptörler gibi ağ bağdaştırıcıları ve bunların bağlandığı ağ arayüzleri.

* **APM** (Advanced Power Management), eski bilgisayar sistemlerinde enerji yönetimini sağlayan bir standarttır, ancak ACPI gibi daha modern yönetim teknolojileriyle yer değiştirmiştir.

* **Bağımlılıklar** (Dependencies): Yazılım paketlerinin diğer paketlere veya kütüphanelere bağımlılıkları. Paket yöneticileri bu bağımlılıkları otomatik olarak yönetir.

* **Bellek Yönetimi** (Memory Management): Sistem belleğinin kullanımını izleme, optimize etme ve yönetme işlemi. Bellek sızıntıları ve düşük bellek uyarıları gibi sorunları tespit etmek için önemlidir.

* **BIOS** (Basic Input/Output System): Bir bilgisayarın donanımını başlatmak ve temel giriş/çıkış işlevlerini sağlamak için kullanılan bir yazılımdır.

* **Çekirdek Derleme** (Kernel Compilation): Linux çekirdeğini belirli bir sistem için özelleştirmek veya yeni özellikler eklemek için çekirdeği yeniden derleme süreci.

* **Çekirdek** (Kernel): Linux'un merkezi bileşeni. Donanım ile iletişim kurar ve diğer yazılımların çalışmasını sağlar.

* **Daemon**: Arka planda çalışan süreçler. Örneğin, web sunucuları (Apache, Nginx) ve veritabanı sunucuları (MySQL, PostgreSQL) gibi.

* **Dağıtım** (Distribution): Linux'un bir versiyonu veya paketi. Örneğin, Ubuntu, Fedora, Debian gibi.

* **Dosya Sistemleri** (File Systems): Linux'un farklı depolama cihazları üzerinde verileri organize etmek için kullandığı yapılar. Örneğin, ext4, XFS, Btrfs gibi.

* **Dosya ve Dizinler**: Linux'ta her şey dosya veya dizin olarak temsil edilir. /home, /etc, /var gibi dizinler ve dosya uzantıları.

* **Dosya İzinleri** (File Permissions): Dosyaların ve dizinlerin erişim izinleri. Kullanıcılar ve gruplar için okuma, yazma ve çalıştırma izinleri belirlenebilir.

* **GUI** (Graphical User Interface): Grafiksel kullanıcı arayüzü. GNOME, KDE gibi masaüstü ortamları.

* **Güvenlik Duvarı** (Firewall): Ağ trafiğini kontrol eden güvenlik duvarı yazılımı. IPTables, UFW gibi araçlar kullanılabilir.

* **Hizmetler** (Services): Sistemde çalışan ve belirli bir görevi yerine getiren yazılım parçaları. Önyükleme sırasında otomatik olarak başlayabilirler.

* **Kernel Modülü** (Kernel Module): Linux çekirdeğine dinamik olarak eklenen sürücüler veya özellikler. Örneğin, bir donanım sürücüsü bir kernel modülü olarak yüklenir.

* **Kernel Panic**: Linux Kernel'inin kritik bir hatayla karşılaştığında kendini korumak için durması. Genellikle sistemde ciddi bir sorun olduğunu gösterir.

* **Kernel Parametreleri** (Kernel Parameters): Linux çekirdeğine başlatma sırasında geçirilen özel parametreler. Performansı, güvenliği veya donanım uyumluluğunu etkileyebilirler.

* **Komut Satırı Geçmişi** (Command Line History): Kullanıcıların daha önce çalıştırdıkları komutların bir listesi. Geçmiş komutlarınızı tekrar kullanmanızı sağlar.

* **Konsol** (Console): Terminal penceresi veya gerçek konsol donanımı. Komutları yazıp çalıştırmanızı sağlar.

* **Kök Dosya Sistemi** (Root Filesystem): Linux'un en üst düzey dosya sistemi. "/" olarak adlandırılır ve tüm diğer dosya ve dizinler bu kök dizinin altında yer alır.

* **Kullanıcı** (User): Sistemdeki normal kullanıcı hesapları.

* **Kullanıcı Oturumu** (User Session): Bir kullanıcının bir bilgisayarda oturum açtığı ve işlemlerini gerçekleştirdiği zaman aralığı.

* **Önyükleyici** (Bootloader): Bilgisayarın işletim sistemini başlatmak için kullanılan yazılım parçasıdır. Temel görevi, bilgisayar açıldığında BIOS veya UEFI tarafından yüklenen ve ardından işletim sistemi yüklenirken kullanılan bir programdır.

* **Paket Yöneticisi** (Package Manager): Yazılım paketlerini yöneten araç. Yeni yazılım yüklemek veya mevcut yazılımları güncellemek için kullanılır.

* **Root Kullanıcı** (Root User): Linux'un sistem yöneticisi. Tam yetkiye sahip kullanıcı hesabıdır.

* **SSH Anahtarları** (SSH Keys): SSH ile güvenli erişim için kullanılan kimlik doğrulama anahtarları.

* **SSH** (Secure Shell): Uzak sistemlere güvenli bir şekilde erişmek için kullanılan bir protokol.

* **Shell betikleri** (Shell Scripts): Kabuk komutlarını içeren ve belirli bir görevi otomatikleştirmek için kullanılan metin dosyaları.

* **Shell**: Komutları çalıştırmak için kullanılan program. Bash, Zsh gibi popüler kabuklar bulunur.

* **Sudo**: Belirli komutları yönetici (root) yetkileriyle çalıştırmak için kullanılan bir komut. Genellikle güvenlik nedenleriyle tavsiye edilir.

* **Takas Alanı** (Swap Space): Fiziksel bellek (RAM) yetersiz olduğunda kullanılan sanal bellek alanı. Disk üzerindeki özel bir bölüm veya dosya olabilir.

* **Terminal Komutları**: ls (list), cd (change directory), mkdir (make directory), rm (remove), cp (copy), mv (move) gibi komutlar.

* **Terminal**: Komut satırı arayüzü. Metin tabanlı komutlar kullanarak işlemleri gerçekleştirmenizi sağlar.

* **X11 Yöneticisi** (X11 Manager): GUI uygulamalarının ekrana çizilmesini ve kullanıcı etkileşimini yöneten bir sistem bileşeni.

* **Yapılandırma Dosyaları**: Sistem ayarlarını ve yapılandırmalarını içeren metin dosyaları. Örneğin, /etc/hosts, /etc/fstab gibi.

* **Yapılandırma Yöneticisi** (Configuration Manager): Sistem ayarlarını yöneten araçlar. Örneğin, NetworkManager ağ yapılandırmalarını yönetir.

* **Yazılım Depoları** (Software Repositories): Yazılım paketlerini depolayan ve dağıtan sunucular. Paket yöneticileri bu depoları kullanarak yazılım yükler.

