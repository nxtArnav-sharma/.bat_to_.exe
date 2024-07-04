# Batch to EXE Converter

This project provides a simple batch script to convert any .bat file into a self-extracting .exe file using Windows' built-in IExpress tool. This conversion method does not require any external tools and leverages the IExpress Wizard included in Windows to package batch scripts into executable files.

## Features

Converts .bat files to .exe files without external tools.
Utilizes the built-in IExpress Wizard.
Creates self-extracting packages that run the original batch script.
Simple and easy to use.


## Usage

1. Clone this repository or download the convert_to_exe.bat file.

2. Open a Command Prompt and navigate to the directory containing convert_to_exe.bat.

3. Run the script with the path to your .bat file as an argument:

```shell
convert_to_exe.bat yourfile.bat
```
The script will generate an .exe file in the same directory as the input .bat file.


## Example
 To convert a batch file example.bat to an executable:

```shell
convert_to_exe.bat example.bat
```
This will create example.exe in the same directory.


## Notes
Ensure that the input .bat file exists and is specified correctly.
The script creates a temporary IExpress directive file during the conversion process, which is cleaned up automatically after the .exe is created.

## License

!!! This project is not under any license and is free to use/modify with specific copyright mentions
