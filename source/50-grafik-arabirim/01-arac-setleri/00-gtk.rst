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


