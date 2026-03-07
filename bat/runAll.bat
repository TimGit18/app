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
   call .\build.bat
   call .\runBuild.bat
   exit /b
   
		
