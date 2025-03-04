Ekran parlaklığı
^^^^^^^^^^^^^^^^
Bir laptop kullanıyorsanız ve ekran parlaklığını elle kontrol etmek istiyorsanız bu bölümde nasıl yapılacağı anlatılmıştır.

öncelikle hangi aygıtlar mevcut listeleyelim

.. code-block:: shell

    ls /sys/class/backlight
    > intel_backlight

Ardından maximum değeri öğrenelim.

.. code-block:: shell

    cat /sys/class/backlight/intel_backlight/max_brightness
    > 24242

Şimdi istediğimz değeri ayarlayabiliriz. Bunun için istediğimz değeri ağaıdaki gibi yazalım.

.. code-block:: shell

    # %50 parlaklık için
    echo 12000 > /sys/class/backlight/intel_backlight/brightness

**Not** bu işlem için root gereklidir. %0 parlaklık ekranın tamamen kararmasına neden olabilir.

