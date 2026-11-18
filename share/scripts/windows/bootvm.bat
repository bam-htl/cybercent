@echo off
setlocal

REM Get the directory of this script
set "SCRIPT_DIR=%~dp0"

REM Path to the virtual disk
set "VM_DISK=%SCRIPT_DIR%..\..\cybercent.qcow2"

REM Check whether the virtual disk exists
if not exist "%VM_DISK%" (
    echo Error: VM disk not found at %VM_DISK%
    exit /b 1
)

REM Path to QEMU
set "QEMU=C:\Program Files\qemu\qemu-system-x86_64.exe"

REM Check whether QEMU is installed
if not exist "%QEMU%" (
    echo Error: QEMU not found
    exit /b 1
)

REM Boot the CyberCent VM
REM Allocate 8 GB of RAM
REM Assign 4 CPU cores
REM Enable WHPX hardware acceleration
REM Attach the virtual disk
REM Forward host port 2222 to guest SSH port 22
REM Enable VNC on localhost port 5900

"%QEMU%" ^
    -m 8192 ^
    -smp 4 ^
    -accel whpx ^
    -drive "file=%VM_DISK%,format=qcow2" ^
    -nic "user,hostfwd=tcp:127.0.0.1:2222-:22" ^
    -vnc 127.0.0.1:0

endlocal
