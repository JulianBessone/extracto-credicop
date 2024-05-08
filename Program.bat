@echo off
cls
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
set "directorio=C:\dev\extracto-credicop"

REM Definir las opciones para el usuario
echo Seleccione el banco:
echo 1. Banco Macro
echo 2. Credicop
set /p "opcion=Ingrese el número de su elección: "

REM Establecer el directorio de descargas en función de la opción seleccionada
if "%opcion%"=="1" (
    set "descargas=C:\Ruta\Al\Directorio\De\Descargas\Del\Banco\Macro"
) elseif "%opcion%"=="2" (
    set "descargas=C:\Ruta\Al\Directorio\De\Descargas\De\Credicop"
) else (
    echo Opción no válida.
    exit /b
)

REM Navega al directorio deseado
cd /d "%descargas%"

REM Buscar el archivo XLS más reciente en el directorio de origen
for /f "delims=" %%A in ('dir /b /o-d /a-d "%descargas%\*.xls*" 2^>nul') do (
    set "archivo=%%A"
    goto copiar_archivo
)
echo No se encontraron archivos XLS en %descargas%


:copiar_archivo
REM Copiar el archivo al directorio de destino
copy /Y "%descargas%\%archivo%" "%directorio%\excels\data.xls"
echo Archivo %archivo% copiado a %directorio_destino%


REM Navega al directorio deseado
cd /d "%directorio%"


if "%opcion%"=="1" (
    echo Iniciando la aplicación con Banco Macro...
    node macro.js
) elseif "%opcion%"=="2" (
    echo Iniciando la aplicación con Banco Macro...
    node credicop.js
) else (
    echo Opción no válida.
    exit /b
)
