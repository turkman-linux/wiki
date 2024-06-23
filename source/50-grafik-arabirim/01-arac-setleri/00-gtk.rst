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

Gdk backend ayarı
^^^^^^^^^^^^^^^^^
**GDK_BACKEND** değişkenini ayarlayarak uygulamanın X11 veya Wayland üzerinde çalışmasını zorlayabilirsiniz.

Örneğin wayland uyumlu olmayan bir uygulamayı Xwayland ile açmaya zorlamak için.

.. code-block:: shell

	$ GDK_BACKEND=x11 xfce4-panel

Overlay Scrollbar kapatma
^^^^^^^^^^^^^^^^^^^^^^^^^

Gtk3 için **GTK_OVERLAY_SCROLLING=0** değişkenini kullanabilirsiniz.

.. code-block:: shell

	$ GTK_OVERLAY_SCROLLING=0 thunar

Tüm uygulamalarda kullanmak için ise  **~/.config/gtk-3.0/settings.ini** dosyasına aşağıdaki gibi ekleme yapmalısınız:

.. code-block:: shell

	[Settings]
	gtk-overlay-scrolling = false

Gtk4 için ise Bu seçenek kullanılabilir değildir. Uygulamayı yamalayıp tekrar derlemeniz gerekebilir.

Dokunma test modunu açma
^^^^^^^^^^^^^^^^^^^^^^^^
Eğer dokunmatik ekranlı bir cihaz kullanıyorsanız veya yazacağınız uygulamanın dokunmatik ekranda nasıl çalışacağını test etmek istiyorsanız aşağıdaki değişkenleri ayarlamalısınız.

.. code-block:: shell

	# Dokunma test modunu açmak için
	export GTK_TEST_TOUCHSCREEN=1
	xfce4-appfinder


**Not:** Gtk dokunarak kullanımda çeşitli sorunlar çıkarabilir.
Bunun için dokunma eylemlerini kapatıp dokunma test modunu açabilirsiniz.
Ana eylemler dışındaki eylemleri kapatmak için:

.. code-block:: shell

	# Sadece ana eylemleri kullanmak için.
	export GTK_CORE_DEVICE_EVENTS=1


