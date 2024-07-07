Nvidia
======
Nvidia ekran kartı sürücüsü olarak genelikle özgür sürücü olan **nouveau** bulunur.
Bu sürücü her ne kadar özgür yazılım olsa da sahipli sürücü kadar iyi çalışamayabilir.

Nouveau yüklemek için **mesa** paketini kullanmanız yeterlidir.
Çoğu dağıtımda varsayılan olarak nouveau kurulu gelmektedir.

Nouveau sürücüsünü kapatmak için aşağıdaki yolu izleyebiliriz.
**/etc/modprobe.d/blacklist-nvidia-nouveau.conf** dosyasına aşağıkini yazalım:

.. code-block:: shell

	blacklist nouveau
	options nouveau modeset=0

Ardından initramfs dosyamızı güncelleyelim:

.. code-block:: shell

	$ update-initramfs -u -k <kernel-sürümü>

Daha sonra sistemi yeniden başlatabiliriz.

Nvidia sürücünün yüklenmesi
^^^^^^^^^^^^^^^^^^^^^^^^^^^
**Uyarı:** Nvidia sürücü özgür değildir.
Eğer özgür sürücü kullanmak isterseniz **nouveau** kullanmalısınız.

**Not:** Bu kısım ile ilgili olarak `Archlinux paketine<https://gitlab.archlinux.org/archlinux/packaging/packages/nvidia-utils/-/blob/main/PKGBUILD>`_ bakabilirsiniz.

Öncelikle `Nvidia <https://www.nvidia.com/Download/index.aspx?lang=en-us>`_ indirme sayfasından sürücümüzü indirelim.
İşletim sistemi olarak **Linux 64-bit** seçmelisiniz.

Daha sonra indirdiğimiz .bin uzantılı dosyayı arşivden çıkartalım.
Doküman boyunce indirdiğiniz sürüm numarası yerine **xxxx** koyularak anlatılacaktır. Kendi sürümünüze uygun şekilde değiştirin.

.. code-block:: shell

	sh ~/NVIDIA-Linux-x86_64-xxxx.run --extract-only

Şimdi **dkms.conf** dosyamızı yamalayalım. 

.. code-block:: shell

	sed -i "s/__VERSION_STRING/xxxx/" kernel/dkms.conf
	sed -i 's/__JOBS//' kernel/dkms.conf
	sed -i 's/__DKMS_MODULES//' kernel/dkms.conf
	sed -i '$iBUILT_MODULE_NAME[0]="nvidia"\
	DEST_MODULE_LOCATION[0]="/kernel/drivers/video"\
	BUILT_MODULE_NAME[1]="nvidia-uvm"\
	DEST_MODULE_LOCATION[1]="/kernel/drivers/video"\
	BUILT_MODULE_NAME[2]="nvidia-modeset"\
	DEST_MODULE_LOCATION[2]="/kernel/drivers/video"\
	BUILT_MODULE_NAME[3]="nvidia-drm"\
	DEST_MODULE_LOCATION[3]="/kernel/drivers/video"\
	BUILT_MODULE_NAME[4]="nvidia-peermem"\
	DEST_MODULE_LOCATION[4]="/kernel/drivers/video"' kernel/dkms.conf

İlk olarak nouveau kapatalım ve modprobe ayarımızı ekleyelim.:

.. code-block:: shell

	# Bu kısım nouveau kapatmak için gerekli
	echo "blacklist nouveau" > "/etc/modprobe.d/blacklist-nvidia-nouveau.conf"
	echo "options nouveau modeset=0" >> "/etc/modprobe.d/blacklist-nvidia-nouveau.conf"
	# Bu kısım nvidia için gerekli
	echo "nvidia-uvm" >> "/etc/modprobe.d/blacklist-nvidia-nouveau.conf"

Şimdi kernel için dkms modülünü kopyalayalım:

.. code-block:: shell

	cp -dr --no-preserve='ownership' kernel /usr/src/nvidia-xxxx"

X11 sürücüsünü kopyalayalım:

.. code-block:: shell

	install -Dm755 nvidia_drv.so "/usr/lib/xorg/modules/drivers/nvidia_drv.so"

Firmware kopyalayalım:

.. code-block:: shell

	install -Dm644 -t "/lib/firmware/nvidia/xxxx/" firmware/*.bin

Kütüphaneleri kopyalayalım:

.. code-block:: shell

	# Wayland/GBM
	install -Dm755 libnvidia-egl-gbm.so.1* -t "/usr/lib/"
	install -Dm644 15_nvidia_gbm.json "/usr/share/egl/egl_external_platform.d/15_nvidia_gbm.json"
	mkdir -p "/usr/lib/gbm"
	ln -sr "/usr/lib/libnvidia-allocator.so.xxxx" "/usr/lib/gbm/nvidia-drm_gbm.so"

	# OpenGL libraries
	install -Dm755 "libEGL_nvidia.so.xxxx" "/usr/lib/libEGL_nvidia.so.xxxx"
	install -Dm755 "libGLESv1_CM_nvidia.so.xxxx" "/usr/lib/libGLESv1_CM_nvidia.so.xxxx"
	install -Dm755 "libGLESv2_nvidia.so.xxxx" "/usr/lib/libGLESv2_nvidia.so.xxxx"
	install -Dm644 "10_nvidia.json" "/usr/share/glvnd/egl_vendor.d/10_nvidia.json"

	# OpenGL core library
	install -Dm755 "libnvidia-glcore.so.xxxx" "/usr/lib/libnvidia-glcore.so.xxxx"
	install -Dm755 "libnvidia-eglcore.so.xxxx" "/usr/lib/libnvidia-eglcore.so.xxxx"
	install -Dm755 "libnvidia-glsi.so.xxxx" "/usr/lib/libnvidia-glsi.so.xxxx"

	# misc
	install -Dm755 "libnvidia-api.so.1" "/usr/lib/libnvidia-api.so.1"
	install -Dm755 "libnvidia-fbc.so.xxxx" "/usr/lib/libnvidia-fbc.so.xxxx"
	install -Dm755 "libnvidia-encode.so.xxxx" "/usr/lib/libnvidia-encode.so.xxxx"
	install -Dm755 "libnvidia-cfg.so.xxxx" "/usr/lib/libnvidia-cfg.so.xxxx"
	install -Dm755 "libnvidia-ml.so.xxxx" "/usr/lib/libnvidia-ml.so.xxxx"
	install -Dm755 "libnvidia-glvkspirv.so.xxxx" "/usr/lib/libnvidia-glvkspirv.so.xxxx"
	install -Dm755 "libnvidia-allocator.so.xxxx" "/usr/lib/libnvidia-allocator.so.xxxx"
	install -Dm755 "libnvidia-gpucomp.so.xxxx" "/usr/lib/libnvidia-gpucomp.so.xxxx"

	# Vulkan ICD
	install -Dm644 "nvidia_icd.json" "/usr/share/vulkan/icd.d/nvidia_icd.json"
	install -Dm644 "nvidia_layers.json" "/usr/share/vulkan/implicit_layer.d/nvidia_layers.json"

	# VDPAU
	install -Dm755 "libvdpau_nvidia.so.xxxx" "/usr/lib/vdpau/libvdpau_nvidia.so.xxxx"

	# nvidia-tls library
	install -Dm755 "libnvidia-tls.so.xxxx" "/usr/lib/libnvidia-tls.so.xxxx"

	# CUDA
	install -Dm755 "libcuda.so.xxxx" "/usr/lib/libcuda.so.xxxx"
	install -Dm755 "libnvcuvid.so.xxxx" "/usr/lib/libnvcuvid.so.xxxx"
	install -Dm755 "libcudadebugger.so.xxxx" "/usr/lib/libcudadebugger.so.xxxx"

	# NVVM Compiler library loaded by the CUDA driver to do JIT link-time-optimization
	install -Dm644 "libnvidia-nvvm.so.xxxx" "/usr/lib/libnvidia-nvvm.so.xxxx"

	# PTX JIT Compiler (Parallel Thread Execution (PTX) is a pseudo-assembly language for CUDA)
	install -Dm755 "libnvidia-ptxjitcompiler.so.xxxx" "/usr/lib/libnvidia-ptxjitcompiler.so.xxxx"

	# raytracing
	install -Dm755 "nvoptix.bin" "/usr/share/nvidia/nvoptix.bin"
	install -Dm755 "libnvoptix.so.xxxx" "/usr/lib/libnvoptix.so.xxxx"
	install -Dm755 "libnvidia-rtcore.so.xxxx" "/usr/lib/libnvidia-rtcore.so.xxxx"

	# NGX
	install -Dm755 nvidia-ngx-updater "/usr/bin/nvidia-ngx-updater"
	install -Dm755 "libnvidia-ngx.so.xxxx" "/usr/lib/libnvidia-ngx.so.xxxx"
	install -Dm755 _nvngx.dll "/usr/lib/nvidia/wine/_nvngx.dll"
	install -Dm755 nvngx.dll "/usr/lib/nvidia/wine/nvngx.dll"

	# Optical flow
	install -Dm755 "libnvidia-opticalflow.so.xxxx" "/usr/lib/libnvidia-opticalflow.so.xxxx"

	# Cryptography library wrapper
	install -Dm755 "libnvidia-pkcs11.so.xxxx" "/usr/lib/libnvidia-pkcs11.so.xxxx"
	install -Dm755 "libnvidia-pkcs11-openssl3.so.xxxx" "/usr/lib/libnvidia-pkcs11-openssl3.so.xxxx"

	# Debug
	install -Dm755 nvidia-debugdump "/usr/bin/nvidia-debugdump"

	# nvidia-xconfig
	install -Dm755 nvidia-xconfig "/usr/bin/nvidia-xconfig"
	install -Dm644 nvidia-xconfig.1.gz "/usr/share/man/man1/nvidia-xconfig.1.gz"

	# nvidia-bug-report
	install -Dm755 nvidia-bug-report.sh "/usr/bin/nvidia-bug-report.sh"

	# nvidia-smi
	install -Dm755 nvidia-smi "/usr/bin/nvidia-smi"
	install -Dm644 nvidia-smi.1.gz "/usr/share/man/man1/nvidia-smi.1.gz"

	# nvidia-cuda-mps
	install -Dm755 nvidia-cuda-mps-server "/usr/bin/nvidia-cuda-mps-server"
	install -Dm755 nvidia-cuda-mps-control "/usr/bin/nvidia-cuda-mps-control"
	install -Dm644 nvidia-cuda-mps-control.1.gz "/usr/share/man/man1/nvidia-cuda-mps-control.1.gz"

	# nvidia-modprobe
	install -Dm4755 nvidia-modprobe "/usr/bin/nvidia-modprobe"
	install -Dm644 nvidia-modprobe.1.gz "/usr/share/man/man1/nvidia-modprobe.1.gz"

	# nvidia-persistenced
	install -Dm755 nvidia-persistenced "/usr/bin/nvidia-persistenced"
	install -Dm644 nvidia-persistenced.1.gz "/usr/share/man/man1/nvidia-persistenced.1.gz"

Son olarak dkms modülümüzü derleyelim ve initramfs güncelleyelim:

.. code-block:: shell

	$ dkms autoinstall
	$ update-initramfs -u -k <kernel-sürümü>

Sistemi yeniden başlatabilirsiniz.


Çoklu ekran kartı kullanımı
^^^^^^^^^^^^^^^^^^^^^^^^^^^
Eğer cihazınızda nvidia 2. ekran kartı ise varsayılan olarak uygulamalar nvidia ile çalışmaz. Bunun için uygulamayı aşağıdaki gibi çalıştırmalısınız.

.. code-block:: shell

	__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia <çalıştırılacak-komut>

Eğer tüm sistemin nvidia ile çalışmasını istiyorsanız Bu değişkenleri **/etc/profile.d/nvidia.sh** içerisine kaydedin.

.. code-block:: shell

	export __NV_PRIME_RENDER_OFFLOAD=1
	export __GLX_VENDOR_LIBRARY_NAME=nvidia

**Not:** Bu yöntem sağlıklı çalışmayabilir.


