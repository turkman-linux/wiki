Gtk
===
Gtk (GIMP Tool Kit) bir özgür grafik araç setidir.
C ile yazılmıştır fakat birçok programlama dili ile kullanılabilir.

Örnek olarak aşağıdaki C kodu gösterilebilir. (Gtk 3 için)

.. code-block:: C

	#include <gtk/gtk.h>
	
	int main(int argc, char** argv){
	    // gtk init
	    gtk_init (&argc, &argv);
	    // pencere oluşturma
	    GtkWindow *window = gtk_window_new();
	    // pencereyi gösterme
	    gtk_widget_show_all(window);
	    // uygulamayı çalıştırma
	    gtk_main();
	    // çıkış
	    return 0;
	}

Derlemek için aşağıdaki komut kullanılabilir.

.. code-block:: shell

	$ gcc -c main.c `pkg-config --cflags gtk+-3.0`
	$ gcc -o main main.o `pkg-config --libs gtk+-3.0`

**python** ile ile aşağıdaki gibi kullanılabilir. (Gtk 3 için)


.. code-block:: python

	# gobject kütüphanesini yükleme
	import gi
	gi.require_version('Gtk', '3.0')
	from gi.repository import Gtk
	# pencere oluşturma
	window = Gtk.Window
	# pencereyi gösterme
	window.show_all()
	# çalıştırma
	Gtk.main()

Tema yükleme
^^^^^^^^^^^^
Simge temalarını **~/.icons** içine, gtk temalarını ise **~/.themes** içine kopyalamanız gerekmektedir.
Ana dizinin içerisinde **index.theme** dosyası bulunmalıdır. Alt dizinler dikkate alınmaz.

Tema ayarlama
^^^^^^^^^^^^^
Gtk temasını tek bir uygulama için değiştirmek için **GTK_THEME** değişkenini değiştirebilirsiniz.

.. code-block:: shell

	$ GTK_THEME=Arc-Dark thunar

Tüm uygulamalar için değiştirmek istiyorsanız **~/.config/gtk-3.0/settings.ini** (gtk4 için gtk-4.0) dosyasını düzenlemelisiniz.

.. code-block:: shell

	[Settings]
	gtk-theme-name=Arc-Dark
	gtk-icon-theme-name=Tango

**Not:** libadwaita tabanlı gtk4 uygulamalarında tema ayarlama konusunda sıkıntı yaşayabilirsiniz.
Temayı zorlamak istiyorsanız **GTK_THEME** değişkenini kullanmayı deneyin.

**Not:** kullandığınız masaüstü ortamının tema ayarları varsa öncelikle onu kullanmalısınız.

**Yazar Notu:** Göz sağlığınız için açık tema kullanmayın :D

Flatpak uygulamaları temanızı dikkate almıyorsa aşağıdaki komut ile düzeltebilirsiniz:

.. code-block:: shell

	# kullanıcı temaları
	$ flatpak override org.example.application --filesystem=~/.themes:ro
	# sistem temaları
	$ flatpak override org.example.application --filesystem=/usr/share/themes:ro


