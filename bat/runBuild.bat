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
    call :run_main_class
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
    cd ..
    java -cp %build_dir%;%properties_dir%;%log4j_api_jar%;%log4j_core_jar% de.domain.app.control.Main
    exit /b
