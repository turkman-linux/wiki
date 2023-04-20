3D controller kapatmak
======================
Çift ekran kartı bulunan laptoplarda **3D controller** bulunur.
Bunun yanında bir de **VGA controller** bulunur. 

**3D controller** daha yüksek güç tükettiği ve gündelik kullanımda hiçbir işe yaramadığı için kapatmak istenilebilir.

Bunun için öncelikle **3D controller** aygıtımızı tespit edelim.

.. code-block:: shell

	for dir in /sys/class/drm/card[0-9*] ; do
    	# 03 Display controller
    	# 02 3D controller
	    if grep "^0x0302" $dir/device/class ; then
	      pci="$(basename $(readlink $dir/device))"
	      echo "Found 3D controller: ${pci:5}"
	    fi
	done

Daha sonra hbulduğumuz pci adını kullanarak donanımı kapatalım. Bu komutu başlangıçta çalıştırmamız gereklidir.

.. code-block:: shell

	echo 1 > /sys/bus/pci/devices/0000:<pci-adi>/remove

**Not:** Türkmen linuxta bu iş için **disable-secondary-gpu** adında bir servis oluşturulmuştur.
Bu servisi etkinleştirmeniz yeterli olmaktadır.

.. code-block:: shell

	$ rc-update add disable-secondary-gpu