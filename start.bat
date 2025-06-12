@echo off
:: ============================
:: Script d'installation Spotify
:: Copie dpapi.dll & config.ini
:: par @Hugo76macha
:: ============================

setlocal EnableDelayedExpansion
title Installation - Configuration Spotify
color 0A

:: Détection du nom d'utilisateur
set "USERNAME=%USERNAME%"
set "TARGET_PATH=C:\Users\%USERNAME%\AppData\Roaming\Spotify"

echo.
echo --------------------------------------------
echo   🔧 Initialisation de l'installation...
echo --------------------------------------------
echo.

:: Vérification de l'existence du dossier Spotify
if not exist "!TARGET_PATH!" (
    echo ❌ Le dossier Spotify est introuvable.
    echo 🔁 Veuillez réinstaller Spotify puis relancer ce script.
    goto end
)

:: Téléchargement des fichiers
echo 🌐 Téléchargement des fichiers depuis GitHub...
curl -L -o "%TEMP%\dpapi.dll" https://raw.githubusercontent.com/<TON_UTILISATEUR>/<TON_REPO>/main/dpapi.dll
curl -L -o "%TEMP%\config.ini" https://raw.githubusercontent.com/<TON_UTILISATEUR>/<TON_REPO>/main/config.ini

:: Vérification des téléchargements
if not exist "%TEMP%\dpapi.dll" (
    echo ❌ Échec du téléchargement de dpapi.dll
    goto end
)
if not exist "%TEMP%\config.ini" (
    echo ❌ Échec du téléchargement de config.ini
    goto end
)

:: Copie des fichiers vers le dossier Spotify
echo 🔄 Copie des fichiers vers "!TARGET_PATH!"...
copy /Y "%TEMP%\dpapi.dll" "!TARGET_PATH!\dpapi.dll" >nul
copy /Y "%TEMP%\config.ini" "!TARGET_PATH!\config.ini" >nul

:: Succès
echo.
echo ✅ Installation terminée avec succès !
echo 📂 Fichiers placés dans : !TARGET_PATH!
echo.

:end
echo Appuyez sur une touche pour quitter...
pause >nul
exit /b
