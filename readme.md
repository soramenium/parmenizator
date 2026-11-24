	wget https://github.com/soramenium/parmenizator/archive/refs/heads/main.zip
	unzip main.zip
	./parmenizator-main/automat.sh

# 1. Założenia projektu:
Pakiet składa się z wrappera i modułów.
Każdy moduł jest standalone skryptem bashowym i odpowiada za daną jedną funkcjonalność. Odpalając dany skrypt poprowadzi on użytkownika przez wszystkie możliwe opcje.
Wrapper odpowiada za przyśpieszone wykonanie wszystkich modułów. Jeśli moduł zostanie wywołany przez wrapper to wrapper przekaże mu wszystkie potrzebne zmienne do wykonania bez niańczenia ze strony usera.
# 2. Przewidziana funkcjonalność:
- [x] rozpoznanie systemu (debian 13.4, fedora, other)
	- jeśli inny niż dwa pierwsze to wychodzi ze skryptu z informacją, że nie ten system nie ma wsparcia
- [ ] Instalacja pakietów
	- odpowiedni dobór pakietów zależnie od systemu
- [ ] Konfiguracja GRUB
	- ustawi naszą tapetę jako tło gruba
	- ustawi jądro RT jako domyślne
	- wyłączy oczekiwanie na wybór użytkownika
- [ ] Autologowanie
	- enable
	- disable
- [ ] Konfiguracja SSH
	- przywrócenie domyślnych ustawień systemu
	- ustawienie portu 2222
	- (manual) inny port
- [ ] Kioskifikuj
		(sprawdzenie czy jest DE, jakie DE i dobranie ustawień systemowych oraz DE)
	- ustawia naszą tapetę
	- wyłącza wygaszanie ekranu
	- wyłącza usypianie komputera
	- zmienia funkcje Power Buttona, żeby nic nie robił (not working, need fix)
- [ ] Wyłącz DE
	- sprawdza czy jest dostępne DE
		- przełącz default terminal na dostępne DE
		- przełącz default terminal na CLI
- [ ] Obfuskacja
	- włącza cmatrix by default
	- wyłącza obfuskacje
- [ ] LOB
	- ujwi jak, ale ma odpalać parma ze startem systemu na tty2
- [ ] wyłącz autoupdaty
	- trigger dla pewności - ma sprawdzić czy wszystkie opcje auto-update'u są wyłączone
- [ ] network manager
	- przejście na dhcp
	- przejście na static ipv4
	- obsługa CANów
- [ ] update
	- sprawdza czy jest folderskryptu.backup
	- usuwa powyższy i tworzy kopię obecnego
	- pobiera najnowszą wersję z githuba
	- rozpakowuje zip i go usuwa
	- printuje że done i pyta czy wyjść czy relaunch w nową 