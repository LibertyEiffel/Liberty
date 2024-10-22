:: Installs Liberty Eiffel from distribution germ using Tiny-C compiler
:: (C) 2024 Hans Zwakenberg.  Released under the (CC) Creative Commons 4.0 license
::                            https://creativecommons.org/licenses/by/4.0/
:: In Part based on the 2016 GSOC effort by Petru Gurita

@echo off
setlocal enabledelayedexpansion
color 8E
CLS

echo:
@echo #################################################################
@echo ###       Installing Liberty-Eiffel, using Tiny-C (tcc)       ###
@echo #################################################################
echo:
@echo Start: %time%
echo:
call :verify_prerequisites
call :create_configuration_file
call :compile_germ
call :compile_T1
call :compile_T2
call :compile_T3
call :binary_compare_C2C_versions
call :compile_and_install_tools

echo:
@echo Finish: %time%
echo:
echo * Done, Liberty Eiffel installation finished
echo:
title ###  Liberty Eiffel installation completed  ###
pause

:: reset cmd window title and colour
title ""
color 0F
:: jumping to EOF to prevent fall-through into subroutines
goto :EOF

:: ######################################################################


:: ### SUBROUTINES SECTION ###

:: create configuration file
:verify_prerequisites
TITLE "###  Verifying prerequisites  ###"
   @echo * Verifying installation prerequisites
   set installation_path=%~dp0
   cd resources\smarteiffel-germ
   @echo   - creating temporary directories
   if not exist T1 mkdir T1 > nul
   if not exist T2 mkdir T2 > nul
   if not exist T3 mkdir T3 > nul
   cd !installation_path!
   if not exist bin mkdir bin > nul
   tcc -v > tcc.txt
   set /p compiler=<tcc.txt
   del tcc.txt
   @echo   - searching tcc compiler, found: %compiler%
   @echo   - adding !installation_path!bin' to search path
   setx path "%path%;!installation_path!bin" >NUL
   exit /b
:: end of subroutine


:: create configuration file
:create_configuration_file
TITLE "###  Creating Liberty Eiffel's configuration file  ###"
   echo:
   @echo * Creating configuration file 'liberty.cfg' for use with Tiny-C
   (
      echo [General]
      echo bin: !installation_path!bin
      echo sys: !installation_path!sys
      echo short: !installation_path!short
      echo flavor: Windows
      echo.
      echo [Environment]
      echo path_eiffel: !installation_path!
      echo path_eiffel_core: !installation_path!src\lib
      echo path_eiffel_extra: !installation_path!src\wrappers
      echo path_eiffel_staging: !installation_path!src\staging
      echo path_smarteiffel: !installation_path!src\smarteiffel
      echo path_tools: !installation_path!src\tools
      echo path_tutorial: !installation_path!tutorial
      echo path_work: !installation_path!work
      echo hyphen: -
      echo.
      echo [Loadpath]
      echo eiffel_core: ${path_eiffel_core}\loadpath.se
      echo eiffel_extra: ${path_eiffel_extra}\loadpath.se
      echo eiffel_staging: ${path_eiffel_staging}\loadpath.se
      echo test: ${path_eiffel}\test\loadpath.se
      echo smarteiffel: ${path_smarteiffel}\loadpath.se
      echo tools: ${path_tools}\loadpath.se
      echo tutorial: ${path_tutorial}\loadpath.se
      echo.
      echo [Tools]
      echo ace_check: ace_check
      echo c2c: compile_to_c
      echo c: compile
      echo class_check: class_check
      echo clean: clean
      echo doc: eiffeldoc
      echo find: finder
      echo make: se_make.bat
      echo mock: mock
      echo pretty: pretty
      echo short: short
      echo test: eiffeltest
      echo test_ng: eiffeltest_ng
      echo test_server: eiffeltest_server
      echo wrap: wrappers_generator
      echo x_int: extract_internals
      echo.
      echo [boost]
      echo c_compiler_type: tcc
      echo c_compiler_path: tcc
      echo c_compiler_options: -m64 -O2
      echo c_linker_path: tcc
      echo c_linker_options: 
      echo.
      echo [no_check]
      echo c_compiler_type: tcc
      echo c_compiler_path: tcc
      echo c_compiler_options: -m64 -O2
      echo c_linker_path: tcc
      echo c_linker_options: 
      echo.
      echo [require_check]
      echo c_compiler_type: tcc
      echo c_compiler_path: tcc
      echo c_compiler_options: -m64 -O2
      echo c_linker_path: tcc
      echo c_linker_options: 
      echo.
      echo [ensure_check]
      echo c_compiler_type: tcc
      echo c_compiler_path: tcc
      echo c_compiler_options: -m64 -O2
      echo c_linker_path: tcc
      echo c_linker_options: 
      echo.
      echo [invariant_check]
      echo c_compiler_type: tcc
      echo c_compiler_path: tcc
      echo c_compiler_options: -m64 -O2
      echo c_linker_path: tcc
      echo c_linker_options: 
      echo.
      echo [loop_check]
      echo c_compiler_type: tcc
      echo c_compiler_path: tcc
      echo c_compiler_options: -m64 -O2
      echo c_linker_path: tcc
      echo c_linker_options: 
      echo. 
      echo [all_check]
      echo c_compiler_type: tcc
      echo c_compiler_path: tcc
      echo c_compiler_options: -m64 -O2
      echo c_linker_path: tcc
      echo c_linker_options: 
      echo. 
      echo [debug_check]
      echo c_compiler_type: tcc
      echo c_compiler_path: tcc
      echo c_compiler_options: -m64 -Wl,subsystem=console
      echo c_linker_path: tcc
      echo c_linker_options: 
      echo smarteiffel_options: -no_strip

    ) > "%USERPROFILE%\liberty.cfg" &
    exit /b
:: end of subroutine


:: compiles germ with tcc in multiple phases
:compile_germ
TITLE ###  Compiling Liberty Eiffel's COMPILE_TO_C  ###
   echo:
   cd resources\smarteiffel-germ
   @echo * Initial compilation of compile_to_c C-germ
   tcc -o compile_to_c.exe -m64 -O2 -bench *.c
   echo:
   exit /b
:: end of subroutine


:compile_T1
TITLE ###  Compiling Liberty Eiffel's COMPILE_TO_C  -  T1 ###
   cd T1
   @echo * T1: Recompiling compile_to_c.e
   ..\compile_to_c.exe -boost -high_memory_compiler -no_gc compile_to_c
   tcc -m64 -O2 *.c -o compile_to_c.exe
   exit /b
:: end of subroutine
   
   
:compile_T2
TITLE ###  Compiling Liberty Eiffel's COMPILE_TO_C  -  T2 ###
   cd ../T2
   @echo * T2: Recompiling compile_to_c.e
   ..\T1\compile_to_c.exe -boost -high_memory_compiler -no_gc compile_to_c
   tcc -m64 -O2 *.c -o compile_to_c.exe
   exit /b
:: end of subroutine


:compile_T3
TITLE ###  Compiling Liberty Eiffel's COMPILE_TO_C  -  T3 ###
   cd ../T3
   @echo * T3: Recompiling compile_to_c.e
   ..\T2\compile_to_c.exe -boost -high_memory_compiler -no_gc compile_to_c
   tcc -m64 -O2 *.c -o compile_to_c.exe
   exit /b
:: end of subroutine


:binary_compare_C2C_versions
TITLE ###  Comparison of the last two compile_to_c.exe versions  ###
   cd .. 
   echo:
   @echo * Comparing the two previous compile_to_c versions
   fc /b T2\compile_to_c.exe T3\compile_to_c.exe > nul
   if ERRORLEVEL 1 (
      @echo Please retry the installation process.
      EXIT /B
   )
   @echo    - Previous compile_to_c versions are identical, moving last one to ../bin
   move /y T3\compile_to_c.exe ../../bin >nul
   @echo    - removing temporary directories
   rd /s /q T1\
   rd /s /q T2\
   rd /s /q T3\
   :: remove binary of initial germ compile_to_c as well
   del compile_to_c.exe
   exit /b
:: end of subroutine


:compile_and_install_tools
TITLE ###  Compiling and installing the remaining commands  ###
   echo:
   @echo * Continueing with the remaining tools
   cd !installation_path!src\smarteiffel\commands
   
   @set COMMANDS=clean;compile;ace_check;class_check;eiffeldoc;eiffeltest;extract_internals;finder;mock;pretty;same_executables;same_msg;se;short
   @FOR %%D IN (%COMMANDS%) DO (
      @echo    - %%D.e
      !installation_path!bin\compile_to_c -boost -high_memory_compiler -no_gc -no_split %%D.e
      tcc -m64 -O2 %%D.c -o %%D.exe
	  if exist %%D.bat (
         del %%D.bat
      )		 
   )
   echo:
   @echo    - removing temporary files from commands compilation phase
   @FOR %%D IN (%COMMANDS%) DO (
      clean %%D		 
   )
   
   echo:
   @echo    - Moving these command executables to ../bin
   move /y *.exe !installation_path!bin >nul
 
 exit /b
:: end of subroutine
