@echo off

REM setup run directory
mkdir run
mkdir run\mods

REM create dummy jar file with just meta-inf
IF EXIST build RMDIR /q /s build
IF EXIST "run\mods\XenonMaterials-Dummy.jar" DEL "run\mods\XenonMaterials-Dummy.jar"
mkdir build
XCOPY src\META-INF build\META-INF /s /i /q
copy src\pack.mcmeta build
copy src\pack.png build
cd build
jar --create --file ../run/mods/XenonMaterials-Dummy.jar *
cd ..
REM Removing build directory
RMDIR /q /s build

REM create symlinks so resources live update
mkdir run\thingpacks
cd run\thingpacks
IF NOT EXIST XenonMaterials mklink /J XenonMaterials ..\..\src
IF NOT EXIST XenonMaterialsGenerated mklink /J XenonMaterialsGenerated ..\..\generated
cd ..\..