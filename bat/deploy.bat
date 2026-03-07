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
    call :copy_files
    call :create_jarfile
    exit /b

rem ============
rem Projektpfade
rem ============
:set_project_paths
    set "projects_root=C:\Users\schmi\Daten\Java\Projects"
    set "projects_app_dir=%projects_root%\app"
    set "projects_build_dir=%projects_app_dir%\build"
    set "projects_props_dir=%projects_app_dir%\properties"
    set "projects_meta_dir=%projects_app_dir%\META-INF"
    set "projects_manifest=%projects_meta_dir%\MANIFEST.MF"
    set "dev_log_4j2_xml=%projects_props_dir%\log4j2.xml"
    set "app_properties=%projects_props_dir%\app.properties"

    echo set_project_paths...
    echo %projects_root%
    echo %projects_app_dir%
    echo %projects_build_dir%
    echo %projects_props_dir%
    echo %projects_meta_dir%
    echo %projects_manifest%
    echo %dev_log_4j2_xml%
    echo %app_properties%

    exit /b

rem =========
rem App-Pfade
rem =========
:set_app_paths
    set "runtime_root=C:\Users\schmi\Daten\Java\Applications"
    set "runtime_app_dir=%runtime_root%\app"
    set "runtime_build_dir=%runtime_app_dir%\build"
    set "runtime_jar_file=%runtime_app_dir%\app.jar"
    set "runtime_props_dir=%runtime_app_dir%\properties"
    set "runtime_meta_dir=%runtime_app_dir%\META-INF"
    set "runtime_manifest=%runtime_meta_dir%\MANIFEST.MF"

    echo set_app_paths...
    echo %runtime_root%
    echo %runtime_app_dir%
    echo %runtime_build_dir%
    echo %runtime_jar_file%
    echo %runtime_props_dir%
    echo %runtime_meta_dir%
    echo %runtime_manifest%

    exit /b

rem ====================
rem Kopieren der Dateien
rem ====================
:copy_files
    xcopy /E /Y %projects_build_dir% %runtime_build_dir%
    copy /Y %projects_props_dir% %runtime_props_dir%
    copy /Y %projects_meta_dir% %runtime_meta_dir%

    exit /b

rem =========================
rem Erzeugen der Archiv-Datei
rem =========================
:create_jarfile
    jar cfm %runtime_jar_file% %runtime_manifest% -C %runtime_build_dir% .

    exit /b

