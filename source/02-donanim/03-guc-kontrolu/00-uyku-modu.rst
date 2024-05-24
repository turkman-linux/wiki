Uyku modu
=========
Linux dağıtımlarında uyku modu **elogind** tarafından gerçekleştirilir.
Uyku moduna almak için öncelikle desteklenen modları kontrol etmelisiniz.

.. code-block:: shell

	$ cat /sys/power/state
	>> freeze mem disk standby

Buradaki modlur şu anlama gelir:
* **freeze**: bekleme modu
* **mem** uyku modu
* **disk** hazırda beklet modu
* **stanby** güç açık bekleme modu

Ardından bilgisayarınız linux için acpi tablosuna sahip olduğunu kontrol edin.

.. code-block:: shell

	$ strings /sys/firmware/acpi/tables/DSDT | grep linux -i
	>> Linux

Yukarıdaki komut boş çıktı veriyorsa acpi tablosu yok anlamına gelir.
Linux diğer acpi tabloları ile çalışmayı dener ve muhtemel sorunlara sebep olabilir.

Uyku modunu tetikleme
^^^^^^^^^^^^^^^^^^^^^
logind kullanarak aşağıdaki gibi uyku moduna alabilirsiniz.

.. code-block:: shell

	$ loginctl suspend

Veya doğrudan kernel üzerinden uyku moduna geçirebilirsiniz.

.. code-block:: shell

	$ echo mem > /sys/power/state

**Not:** Bazı donanımlar uyku modunda düzgün çalışmayabilir.


Uyku moduna geçmeyi önleme
^^^^^^^^^^^^^^^^^^^^^^^^^^
Uyku moduna geçmeyi önlemek için **/etc/elogind/suspend.conf** dosyasını aşağıdaki gibi düzenlemelisiniz.

.. code-block:: shell

	[Sleep]
	AllowSuspend=yes


Laptop kapağı kapatma eylemi
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Eğer bir laptop kullanıyorsanız ve kapağı kapattığınızda uykuya geçmesini istemiyorsanız onun için de **/etc/elogind/logind.conf** dosyasını aşağıdaki gibi düzenlemelisiniz.

.. code-block:: shell

	[Login]
	HandleLidSwitch=ignore
	HandleLidSwitchExternalPower=ignore
	HandleLidSwitchDocked=ignore

Burada **ignore** yerine: **poweroff**, **reboot**, **suspend** yazarak ilgili eylemi yapmasını sağlayabilirsiniz.

