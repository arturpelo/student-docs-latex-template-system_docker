@echo off
chcp 65001 >nul
:: --- Uruchamianie w nowym CMD ---
if "%1" neq "new" (
    start "" cmd /c "%~f0 new"
    exit /b
)

:: --- Faktyczne działanie w nowym CMD ---
cls
:: Ustawienie zmiennej ESC dla kolorów ANSI
for /f %%e in ('echo prompt $E ^| cmd') do set "ESC=%%e"
echo __________________________________________________________________
echo [1/3] Czyszczenie plikow wyjsciowych w katalogu glownym...

del /q *.aux *.bbl *.bcf *.blg *.fdb_latexmk *.fls *.log *.out *.run.xml *.synctex.gz *.toc *.lof *.lot *.nav *.snm *.vrb >nul 2>nul
del /q main.pdf >nul 2>nul
echo __________________________________________________________________

echo [2/3] Kompilacja przez Docker (latexmk)...
:: Sprawdzenie dostepnosci Dockera
docker info >nul 2>nul
if errorlevel 1 (
    echo __________________________________________________________________
    echo %ESC%[31m[BLAD] Docker nie jest uruchomiony lub niedostepny.%ESC%[0m
    echo %ESC%[31m       Uruchom Docker Desktop i sprobuj ponownie.%ESC%[0m
    goto :after_compile
)
:: Wyjscie i pliki pomocnicze w katalogu glownym
docker run --rm -v "%cd%:/workdir" texlive/texlive sh -c "latexmk -pdf -interaction=nonstopmode -file-line-error main.tex"

:: Drugi przebieg dla spisu tresci, rysunkow i tabel
docker run --rm -v "%cd%:/workdir" texlive/texlive sh -c "latexmk -pdf -interaction=nonstopmode -file-line-error main.tex"

:after_compile

echo __________________________________________________________________
echo [3/3] Sprawdzanie gotowego PDF w katalogu glownym...

set "PDF_OK=0"

if exist main.pdf (
    set "PDF_OK=1"
    :: Ramka sukcesu
    echo %ESC%[32m┌───────────────────────────────────────────────────────────────┐%ESC%[0m
    echo %ESC%[32m^|     Sukces! Plik PDF znajduje sie w katalogu glownym.          ^|%ESC%[0m
    echo %ESC%[32m└───────────────────────────────────────────────────────────────┘%ESC%[0m
) else (
    :: Ramka błędu
    echo %ESC%[31m┌───────────────────────────────────────────────────────────────┐%ESC%[0m
    echo %ESC%[31m^|   Blad: Nie znaleziono pliku PDF. Sprawdz logi w katalogu.    ^|%ESC%[0m
    echo %ESC%[31m└───────────────────────────────────────────────────────────────┘%ESC%[0m
)

:: Dodatkowe info
echo %ESC%[90m┌───────────────────────────────────────────────────────────────┐%ESC%[0m
echo %ESC%[90m^|%ESC%[34m      LaTeX2PDF – Student-Friendly Docker Compiler v2.1        %ESC%[90m^|%ESC%[0m
echo %ESC%[90m^|       Copyright © 2026 Artur Pelo. All rights reserved.       ^|%ESC%[0m
echo %ESC%[90m└───────────────────────────────────────────────────────────────┘%ESC%[0m

:: Kasowanie plikow tymczasowych
del /q *.aux *.bbl *.bcf *.blg *.fdb_latexmk *.fls *.log *.lol *.out *.run.xml *.synctex.gz *.toc *.lof *.lot *.nav *.snm *.vrb >nul 2>nul
del /q main.bbl main.bcf main.run.xml >nul 2>nul

echo.
pause
if "%PDF_OK%"=="1" (
    exit /b 0
) else (
    exit /b 1
)