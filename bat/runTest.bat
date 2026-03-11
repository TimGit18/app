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
    call :set_library_paths
    call :set_date_settings
    call :create_logfile
    call :run_test_class > %logfile% 2>&1
exit /b

rem ============
rem Projektpfade
rem ============
:set_project_paths
    set "project_root=C:\Users\schmi\Daten\Java\Projects"
    set "app_dir=%project_root%\app"
    set "properties_dir=%app_dir%\properties"
    set "build_dir=%app_dir%\build"
    set "logs_dir=%app_dir%\logs"

    echo set_project_paths...
    echo %project_root%
    echo %app_dir%
    echo %properties_dir%
    echo %build_dir%
    echo %logs_dir%

    exit /b

rem =============
rem Library-Pfade
rem =============
:set_library_paths
    set "libs_root=C:\Users\schmi\Daten\Java\Libraries"
    set "log4j_dir=%libs_root%\apache-log4j-2.25.3-bin"
    set "log4j_api_jar=%log4j_dir%\log4j-api-2.25.3.jar"
    set "log4j_core_jar=%log4j_dir%\log4j-core-2.25.3.jar"
    set "junit5_dir=%libs_root%\junit-5"
    set "junit_jupiter_api_jar=%junit5_dir%\junit-jupiter-api-5.6.1.jar"
    set "junit_console_standalone_api_jar=%junit5_dir%\junit-platform-console-standalone-1.7.0-all.jar"

    echo set_library_paths...
    echo %libs_root%
    echo %log4j_dir%
    echo %log4j_api_jar%
    echo %log4j_core_jar%
    echo %junit5_dir%
    echo %junit_jupiter_api_jar%
    echo %junit_console_standalone_api_jar%

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

rem =======
rem Logfile
rem =======
:create_logfile
    set "logfile=%logs_dir%\test_%year%_%month%_%day%_%hour%_%minute%_%second%.log"
    echo create_logfile...
    echo %logfile%
exit /b


rem =========
rem Run Tests
rem =========
:run_test_class
    echo run_test_class...
    cd %app_dir%
    java -jar %junit_console_standalone_api_jar% --class-path %build_dir% --scan-class-path
exit /b
