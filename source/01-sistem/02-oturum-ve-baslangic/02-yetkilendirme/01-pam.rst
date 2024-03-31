PAM
===
Linux sistemlerinde güvenliği sağlamak için kullanılan PAM (**Pluggable Authentication Modules**), modüler bir yapıya sahiptir ve kullanıcı kimlik doğrulama işlemlerini yönetir.

PAM, modüler bir yapıya sahiptir ve her bir modül belirli bir kimlik doğrulama görevini yerine getirir. Örnek olarak, "pam_unix" modülü, parola tabanlı kimlik doğrulamayı yönetirken, "pam_ldap" modülü LDAP sunucusu üzerinden kimlik doğrulamasını sağlar.

Yapılandırma:
^^^^^^^^^^^^^
PAM'ın yapılandırması genellikle **/etc/pam.d/** dizinindeki dosyalarda yapılır. Bu dosyalarda, farklı hizmetler için kimlik doğrulama adımları belirtilir. Örneğin, login, sshd, su gibi hizmetler için ayrı ayrı PAM yapılandırmaları bulunabilir.

PAM yapılandırma dosyaları, satırlar halinde okunur. Her satır, bir PAM modülünü ve bu modülün ne zaman ve nasıl kullanılacağını tanımlar.

Temel bir PAM yapılandırma dosyası şu bölümleri içerebilir:

.. code-block:: shell

	auth: Kullanıcının kimlik doğrulama süreci.
	account: Kullanıcının hesap durumu kontrolü.
	password: Kullanıcının parola değiştirme işlemleri.
	session: Oturum başlatma ve sonlandırma işlemleri.

PAM yapılandırma dosyalarında, kullanılacak PAM modüllerinin tanımları bulunur. Her modül, bir kütüphane dosyasına (genellikle /lib/security/ dizininde) işaret eder. Modül tanımları, modülün seçeneklerini de içerebilir.

Örnek Bir PAM Yapılandırma Dosyası (SSH için):

.. code-block:: shell

	# SSH için PAM yapılandırma dosyası (/etc/pam.d/sshd)
	
	# Kullanıcı kimlik doğrulama işlemi
	auth       required     pam_sepermit.so
	auth       substack     password-auth
	auth       include      postlogin

	# Kullanıcı hesap durumu kontrolü
	account    required     pam_nologin.so
	account    include      password-auth

	# Parola değiştirme işlemleri
	password   include      password-auth

	# Oturum başlatma ve sonlandırma işlemleri
	session    required     pam_selinux.so
	session    required     pam_loginuid.so
	session    optional     pam_keyinit.so force revoke
	session    include      password-auth
	session    include      postlogin


PAM yapılandırma dosyalarında, PAM modüllerinin davranışını belirleyen çeşitli anahtar kelimeler bulunur. İşte bu anahtar kelimelerden bazılarının anlamları:

* required (gereken):
    Bu anahtar kelime, ilgili PAM modülünün başarılı bir kimlik doğrulama süreci için zorunlu olduğunu belirtir. Yani, bu modül başarısız olursa, kimlik doğrulama işlemi başarısız olur ve kullanıcı erişimi reddedilir.

* requisite (gerekli):
    required ile benzerdir, ancak bu modül başarısız olduğunda, geri kalan modüller çalıştırılmaz ve kimlik doğrulama işlemi doğrudan başarısız olur.

* sufficient (yeterli):
    Bu anahtar kelime, modülün başarılı olması durumunda, kimlik doğrulama işleminin başarılı olduğunu belirtir. Eğer bu modül başarılı olursa, geri kalan modüller çalıştırılmaz.

* optional (isteğe bağlı):
    Bu anahtar kelime, ilgili modülün başarısız olması durumunda, kimlik doğrulama işleminin hala devam edeceğini belirtir. Yani, bu modülün başarısız olması, kimlik doğrulama işlemini doğrudan etkilemez.


Pam modülü yazmak
^^^^^^^^^^^^^^^^^
Örnek bir pam modülü aşağıdaki gibi olabilir:

.. code-block:: C

	#include <security/pam_appl.h>

	PAM_EXTERN int pam_sm_authenticate(pam_handle_t *pamh, int flags, int argc, const char **argv) {
		// Kimlik doğrulama işlemlerini gerçekleştirir
		// Burada gerekli işlemler yapılacaktır
		return PAM_SUCCESS; // İşlem başarılıysa PAM_SUCCESS döner
	}

	PAM_EXTERN int pam_sm_setcred(pam_handle_t *pamh, int flags, int argc, const char **argv) {
		// Kullanıcı kimlik bilgilerini ayarlar
		// Gerekli işlemler yapılabilir
		return PAM_SUCCESS; // İşlem başarılıysa PAM_SUCCESS döner
	}

	PAM_EXTERN int pam_sm_acct_mgmt(pam_handle_t *pamh, int flags, int argc, const char **argv) {
		// Kullanıcı hesabını yönetir
		// Gerekli işlemler yapılabilir
		return PAM_SUCCESS; // İşlem başarılıysa PAM_SUCCESS döner
	}

	PAM_EXTERN int pam_sm_open_session(pam_handle_t *pamh, int flags, int argc, const char **argv) {
		// Kullanıcı oturumunu açar
		// Gerekli işlemler yapılabilir
		return PAM_SUCCESS; // İşlem başarılıysa PAM_SUCCESS döner
	}

	PAM_EXTERN int pam_sm_close_session(pam_handle_t *pamh, int flags, int argc, const char **argv) {
		// Kullanıcı oturumunu kapatır
		// Gerekli işlemler yapılabilir
		return PAM_SUCCESS; // İşlem başarılıysa PAM_SUCCESS döner
	}

	PAM_EXTERN int pam_sm_chauthtok(pam_handle_t *pamh, int flags, int argc, const char **argv) {
		// Kullanıcı parolasını değiştirir
		// Gerekli işlemler yapılabilir
		return PAM_SUCCESS; // İşlem başarılıysa PAM_SUCCESS döner
	}

Modülü aşağıdaki gibi derleyebilirsiniz:

.. code-block:: shell

	gcc -o pam_example.so -fPIC -shared -lpam example.c
	# -lpam libpam bağlamak için
	# -fPIC position independent code açmak için
	# -shared kütüphane dosyası oluşturmak için


Pam kullanımı
^^^^^^^^^^^^^
Aşağıdaki C kodu ile pam kullanarak doğrulama yapabilirsiniz.

.. code-block:: C

	#include <stdio.h>
	#include <stdlib.h>
	#include <security/pam_appl.h>

	// PAM struct yapısı
	static struct pam_conv conv = {
		misc_conv,
		NULL
	};

	int main(int argc, char *argv[]) {
		pam_handle_t *pamh = NULL;
		int retval;
		const char *username = "test"; // Doğrulanacak kullanıcı adı

		// PAM oturumu başlat
		retval = pam_start("login", username, &conv, &pamh);

		// PAM oturumu başlatma hatası kontrolü
		if (retval != PAM_SUCCESS) {
		    fprintf(stderr, "PAM initialization failed: %s\n", pam_strerror(pamh, retval));
		    exit(EXIT_FAILURE);
		}

		// Kullanıcıyı doğrula
		retval = pam_authenticate(pamh, 0);

		// Kullanıcı doğrulama başarılı mı kontrolü
		if (retval == PAM_SUCCESS) {
		    printf("Authentication succeeded!\n");
		} else {
		    fprintf(stderr, "Authentication failed: %s\n", pam_strerror(pamh, retval));
		}

		// PAM oturumu sonlandır
		if (pam_end(pamh, retval) != PAM_SUCCESS) {
		    pamh = NULL;
		    fprintf(stderr, "Failed to release PAM authentication handle\n");
		    exit(EXIT_FAILURE);
		}

		// Programın başarılı bir şekilde sonlandırılması
		return (retval == PAM_SUCCESS) ? EXIT_SUCCESS : EXIT_FAILURE;
	}

Burada **pam_start** fonksiyonu içinde **login** belirttiğimiz için **/etc/pam.d/login** dosyası dikkate alınır. 

