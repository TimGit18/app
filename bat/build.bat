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
