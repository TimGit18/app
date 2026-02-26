@echo off

rem ==============
rem Programmablauf
rem ==============
call :main
exit /b

rem ============
rem Hauptroutine
rem ============
:main
    call :set_project_paths
    call :set_app_paths
    call :set_date_settings
    call :set_cleanup_build
    call :set_source_code_paths
    call :set_library_paths
    call :create_logfile
    exit /b

rem ============
rem Projektpfade
rem ============
:set_project_paths
    set "projects_root=C:\Users\schmi\Daten\Java\Projects"
    set "app_dir=%projects_root%\app"

    echo %projects_root%
    echo %app_dir%

    exit /b

rem =========
rem App-Pfade
rem =========
:set_app_paths
    set "apps_root=C:\Users\schmi\Daten\Java\Applications"
    set "apps_dir=%apps_root%\app"
    set "build_dir=%apps_dir%\build"
    set "logs_dir=%apps_dir%\logs"

    echo %apps_root%
    echo %apps_dir%
    echo %build_dir%
    echo %logs_dir%

    exit /b

rem ===============
rem Quellcode-Pfade
rem ===============
:set_source_code_paths
    set "source_root=%app_dir%\src\de\domain\app"
    set "control_dir=%source_root%\control"
    set "util_dir=%source_root%\util"
    exit /b

rem =============
rem Library-Pfade
rem =============
:set_library_paths
    set "libs_root=C:\Users\schmi\Daten\Java\Libraries"
    set "log4j_dir=%libs_root%\apache-log4j-2.25.3-bin"
    set "log4j_api_jar=%log4j_dir%\log4j-api-2.25.3.jar"
    set "log4j_core_jar=%log4j_dir%\log4j-core-2.25.3.jar"
    exit /b

rem =============
rem Datumsangaben
rem =============
:set_date_settings
    set "year=%date:~6,4%"
    set "month=%date:~3,2%"
    set "day=%date:~0,2%"
    set "hour=%time:~0,2%"
    set "minute=%time:~3,2%"
    set "second=%time:~6,2%"
    exit /b

rem =================
rem Build-Verzeichnis
rem =================
:set_cleanup_build
    rmdir /s /q %build_dir%
    if not exist "%build_dir%" (
    mkdir "%build_dir%"
    )
    exit /b

rem =======
rem Logfile
rem =======
:create_logfile
    set "logfile=%logs_dir%\build_%year%_%month%_%day%_%hour%_%minute%_%second%.log"
    exit /b
