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
    call :set_app_paths
    call :set_library_paths
    call :run_main_class
exit /b

rem =========
rem App-Pfade
rem =========
:set_app_paths
    set "apps_root=C:\Users\schmi\Daten\Java\Applications"
    set "apps_dir=%apps_root%\app"
    set "build_dir=%apps_dir%\build"
    set "logs_dir=%apps_dir%\logs"

    echo set_app_paths...
    echo %apps_root%
    echo %apps_dir%
    echo %build_dir%
    echo %logs_dir%

    exit /b

em =============
rem Library-Pfade
rem =============
:set_library_paths
    set "libs_root=C:\Users\schmi\Daten\Java\Libraries"
    set "log4j_dir=%libs_root%\apache-log4j-2.25.3-bin"
    set "log4j_api_jar=%log4j_dir%\log4j-api-2.25.3.jar"
    set "log4j_core_jar=%log4j_dir%\log4j-core-2.25.3.jar"

    echo set_library_paths...
    echo %libs_root%
    echo %log4j_dir%
    echo %log4j_api_jar%
    echo %log4j_core_jar%
    exit /b


rem ===============
rem Run Application
rem ================
:run_main_class
    echo run_main_class...
    java -cp %build_dir%;%log4j_api_jar%;%log4j_core_jar% de.domain.app.control.Main
    exit /b
