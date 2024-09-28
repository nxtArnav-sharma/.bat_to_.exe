@echo off
setlocal

:: Check if the input file is provided
if "%~1"=="" (
    echo Usage: %~nx0 ^<BatchFile^>
    exit /b 1
)

set "input_bat=%~1"
if not exist "%input_bat%" (
    echo The specified .bat file "%input_bat%" does not exist.
    exit /b 1
)

set "output_exe=%~dpn1.exe"

:: Create the IExpress SED file
set "sed_file=%temp%\convert_to_exe.sed"
(
    echo[Version]
    echo Class=IEXPRESS
    echo[Options]
    echo PackagePurpose=InstallApp
    echo ShowInstallProgramWindow=1
    echo HideExtractAnimation=0
    echo UseLongFileName=1
    echo InsideCompressed=0
    echo CAB_FixedSize=0 
    echo CAB_ResvCodeSigning=0
    echo RebootMode=I
    echo InstallPrompt=%input_bat%
    echo DisplayLicense=
    echo FinishMessage=
    echo TargetName=%output_exe%
    echo FriendlyName=%output_exe%
    echo AppLaunched=%input_bat%
    echo PostInstallCmd=<None>
    echo AdminQuietInstCmd=
    echo UserQuietInstCmd=
    echo SourceFiles=SourceFiles
    echo[SourceFiles]
    echo SourceFiles0=%~dp1
    echo[SourceFiles0]
    echo "%~nx1"=
) > "%sed_file%"

:: Run IExpress to create the EXE
iexpress /n /q /m "%sed_file%"

:: Clean up
del "%sed_file%"

if exist "%output_exe%" (
    echo Successfully created "%output_exe%".
) else (
    echo Failed to create "%output_exe%".
    exit /b 1
)

exit /b 0
