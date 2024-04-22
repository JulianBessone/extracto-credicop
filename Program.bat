@echo off

echo.
echo.
echo.
echo.      ******                                                    
echo.      /*////**                                                   
echo.      /*   /**   *****   ******  ******  ******  *******   ***** 
echo.      /******   **///** **////  **////  **////**//**///** **//**
echo.      /*//// **/*******//***** //***** /**   /** /**  /**/*******
echo.      /*    /**/**////  /////** /////**/**   /** /**  /**/**//// 
echo.      /******* //****** ******  ****** //******  ***  /**//******
echo.      ///////   ////// //////  //////   //////  ///   //  ////// 
echo.
echo.                      Technologhy Innovations ©
echo.                          Make with 🧠 - 2023
echo.
echo.
echo.

REM Define el directorio en el que deseas trabajar
set "directorio=C:\dev\ext"

set "descargas=C:\Users\JGBessone\Downloads"

REM Navega al directorio deseado
cd /d "%descargas%"

REM Encuentra el archivo más reciente con extensión .xlsx en la carpeta de origen
for /f "delims=" %%I in ('forfiles /p "%descargas%" /m *.xlsx /c "cmd /c echo @file @fdate" /d -1 2^>nul') do set "latestFile=%%I"

REM Verifica si se encontró un archivo
if defined latestFile (
    REM Copia el archivo encontrado a la carpeta de destino
    copy "%descargas%\%latestFile%" "%directorio%"
    echo Archivo copiado exitosamente.
) else (
    echo No se encontraron archivos .xlsx en la carpeta de origen.
)

REM Navega al directorio deseado
cd /d "%directorio%"
cls

REM Pregunta al usuario si desea instalar las dependencias
set /p "respuesta=¿Deseas instalar las dependencias? (S/N): "

if /i "%respuesta%"=="S" (
    echo ⏱ Instalando dependencias con npm install...
    npm install

    echo Esperando a que termine la instalación...

    REM Espera 120 segundos (2 minutos) para asegurarte de que npm install haya terminado
    timeout /t 120 >nul

    echo Iniciando la aplicación con npm start...
    npm start
) else (
    echo Iniciando la aplicación con npm start...
    npm start
)