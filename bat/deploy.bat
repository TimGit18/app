rem ============
rem Projektpfade
rem ============
:set_project_paths
    set "projects_root=C:\Users\schmi\Daten\Java\Projects"
    set "app_dir=%projects_root%\app"
    set "props_dir=%app_dir%\properties"
    set "dev_log_4j2_xml=%props_dir\log4j2.xml"

    echo set_project_paths...
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

    echo set_app_paths...
    echo %apps_root%
    echo %apps_dir%
    echo %build_dir%
    echo %logs_dir%

    exit /b



rem ------------------------------------------------------------
rem Deployment der Anwendung
rem ------------------------------------------------------------
copy /Y %project_log4j2_xml% %runtime_log4j2_xml%
copy /Y %project_app_props% %runtime_app_props%
copy /Y %project_manifest% %runtime_manifest%

rem -----------------------------------------------------------
rem Ausführbare Anwendung erzeugen
rem -----------------------------------------------------------
jar cfm %runtime_jar_file% %runtime_manifest% -C %runtime_build% .