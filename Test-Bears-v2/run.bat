@echo off

if not "x%LANDIS_PATH%" ==  "x" goto has_landis_in_path
set LANDIS_PATH=C:\Program Files\LANDIS-II-v7\commands\
set PATH=%PATH%;"%LANDIS_PATH%"
:has_landis_in_path

cls

for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "datestamp=%YYYY%%MM%%DD%" & set "timestamp=%HH%%Min%%Sec%" & set "fullstamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"

call landis-ii-7.cmd input_scenario_SHE.txt 2>&1 | tee "simulation-%fullstamp%.log"
