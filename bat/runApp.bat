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
    call :run_application
    exit /b

rem =========
rem App-Pfade
rem =========
:set_app_paths
    set "runtime_root=C:\Users\schmi\Daten\Java\Applications"
    set "runtime_app_dir=%runtime_root%\app"
    set "runtime_jar_file=%runtime_app_dir%\app.jar"
    rem set runtime_log4j_config_file="log4j.configurationFile=file:///C:/Users/schmi/Daten/Java/Applications/app/properties/log4j2.xml"
    set "runtime_log4j_config_file=\"log4j.configurationFile=file:///%runtime_app_dir%/properties/log4j2.xml\"""

    echo %runtime_root%
    echo %runtime_app_dir%
    echo %runtime_jar_file%
    echo %runtime_log4j_config_file%

    exit /b

rem ========================
rem Ausführen der Anwendung
rem ========================
:run_application
    cd %runtime_app_dir%
    java -Dfile.encoding=UTF8 -jar %runtime_jar_file% -D%runtime_log4j_config_file%
    exit /b

