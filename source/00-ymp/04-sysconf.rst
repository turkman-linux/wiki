.. _sysconf_files:

Sysconf Dosyaları
==================

Sysconf dosyaları, ymp paket yöneticisi için hook mekanizması olarak kullanılır.
Sysconf dosyaları /etc/sysconf.d dizininde bulunur. Bunları `ymp sysconf` komutunu kullanarak manuel olarak tetikleyebilirsiniz.

Örnek sysconf betiği:

.. code-block:: shell

   current=$(date +%s -r /usr/share/glib-2.0/schemas/)
   last=$(cat /var/lib/ymp/sysconf/glib/update.date)
   if [ "$current" != "$last" ] ; then
       glib-compile-schemas /usr/share/glib-2.0/schemas/
       date +%s -r /usr/share/glib-2.0/schemas/ > /var/lib/ymp/sysconf/glib/update.date
   fi


Dizin değiştirme zamanını kullanarak işlemi kontrol edebilirsiniz.

- `OPERATION` çevresel değişkeni mevcut işlemi belirtir (örneğin, postinst, postrm, preinst).
- `OPERATION` değişkeni iletilir, ancak diğer çevresel değişkenler kaldırılır.
- `OPERATION` değişkeni olarak kurulum ve kaldırma için postinst preinst postrm prerm bulunur. Diğer eylemlerde ile işlemle aynı ada sabiptir.
- Sysconf dizinleri (`/var/lib/ymp/sysconf/<hookname>`) ymp tarafından oluşturulur ve paket kaldırıldıktan sonra kaldırılır.
- Önemli bir not olarak, hedef paketten `preinst` ve `postrm` kullanılamaz çünkü paket sysconf dosyaları paketin bir parçasıdır.

Bu yapı, sysconf dosyaları aracılığıyla paket yapılandırmalarının esnek özelleştirmeleri ve yönetimi için olanak sağlar.
