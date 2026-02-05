# Projekt LaTeX z Docker i VS Code oraz z wykorzystaniem narzędzi lokalnych instalowanych w Windows

![Docker](https://img.shields.io/badge/Docker-Desktop-2496ED?logo=docker&logoColor=white)
![VS Code](https://img.shields.io/badge/VS%20Code-Visual%20Studio%20Code-007ACC?logo=visualstudiocode&logoColor=white)
![LaTeX](https://img.shields.io/badge/LaTeX-TeX-008080?logo=latex&logoColor=white)

Ten projekt służy do kompilacji dokumentów LaTeX w środowisku VS Code z wykorzystaniem kontenera Docker.

## Wymagania

- **Docker Desktop** – zainstaluj z [docker.com](https://www.docker.com/products/docker-desktop) i upewnij się, że jest uruchomiony i jesteś zalogowany.
- **Visual Studio Code** – zainstaluj z [code.visualstudio.com](https://code.visualstudio.com).
- **MiKTeX**  - zainstaluje z [https://miktex.org/download](https://miktex.org/download)
- **The Perl for MS Windows** - zainstaluj z [https://strawberryperl.com/](https://strawberryperl.com).
- **Rozszerzenie LaTeX Workshop** – zainstaluj w VS Code (Extensions) wyszukując „LaTeX Workshop” (autor: James Yu).

## Przygotowanie systemu - Krok po kroku (linki do pobrań są w sekcji Wymagania)

1. **VSC** - pobierz i zainstaluj Visual Studio Code 
2. **Zainstaluj i uruchom Docker Desktop**  - zainstaluj, uruchom i zaloguj się, poczekaj aż będzie działał.
3. **Zainstaluj MiKTeX** - pobierz, uruchom instalację, podczas instalacji wybierz ważne opcje -> w 3 kroku wybierz: install missing packages on-the-fly:YES)
4. **Uruchom w Windows -> MiKTex Console** - (aktualizacja) wejdź do zakładki UPDATE i kliknij CHECK FOR UPDATES, po chwili UPDATE NOW.
5. **Zainstaluj  The Perl for MS Windows** - pobierz wersję MSI
6. **w VSC - Zainstaluj LaTeX Workshop** w VS Code (Ctrl+Shift+X → wyszukaj „LaTeX Workshop” → Install).
7. Stwórz katalog(folder) roboczy, nazwij jak chcesz, otwórz go, kliknij prawy przycisk myszy w otwartym oknie i wybierz -> otwórz w terminalu
8. Wpisz **git clone (tutaj skopiowany adres url repozytorium)** i naciśnij enter
9. Zamknij okno terminala
10. Wejdź do pobranego folderu - i w nim otwórz terminal (prawy przycisk myszy i z menu otwórz w terminalu)
11. Wpisz **code .** 
12. **Rozszerzenie LaTeX Workshop** – zainstaluj rozszerzenie (menu po lewej stronie) w VS Code (Extensions) wyszukując „LaTeX Workshop” - zainstaluj
13. z menu górnego otwórz terminal




## Scenariusz A. Użycie wersja z Docker'em

1. Główny plik to **main.tex** - zawiera style, ustawienia i linki do ładowania rozdziałów, generuje spisy
2. Rozdziały są odpowiedni nazwane - znajdziesz je.
3. we Wstępie masz przykłady jak zrobić listingi, tabele grafiki itp.
4. Kompilacja odbywa się w kontenerze Docker zatem w VSC w terminalu wykonaj **.\start_w_Dockert.bat**
5. po chili jeśli Docker Desktop działa ruszy kompilacja - pierwszym razem musi pobrać obrazy
6. po zakończeniu wynik będzie w pliku main.pdf

## Scenariusz B. Użycie bez Docker'a (szybki podgląd)

- jeśli zainstalowałeś(aś) Perl, MiKTeX oraz LaTeX Workshop, możesz pracować z szybkim podglądem
- Wejdź w plik main.tex na górze okna jest zielony przycisk play;
- Teraz podziel sobie ekran na dwie części (podobnie jak to się robi w windowsie)
- Otwórz dowolny Rozdział. Zmień... każde zapisanie pliku będzie aktualizować widok pdf po prawej
- Twórz treści i zapisuj.

## Rozwiązywanie problemów

- Jeśli kompilacja w Scenariuszu A. nie działa, sprawdź czy Docker Desktop jest uruchomiony, lub terminal to PowerShell.

## Licencja

Szczegóły licencji znajdują się w pliku [licencja.txt](licencja.txt).

