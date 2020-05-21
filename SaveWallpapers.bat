@echo off
setlocal
:: Size is in bytes 250 KB
set "min.size=250000"
:: Folder name
set /P name=Enter folder name: 
:: Path to create a folder 
set folder=C:\Users\%username%\Desktop\%name%

:: Access to path to image's folder
cd C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState

:: Check if exist folder to copy all images
IF NOT EXIST "%folder%" (
    mkdir %folder% 
)
:: Copy images from created folder
xcopy Assets %folder%

:: Access to folder
cd %folder%

:: Change file extension to all files to .jpg
ren *.* *.jpg

:: Delete all files than less size that 250 KB
for /f  "usebackq delims=;" %%A in (`dir /b /A:-D *.*`) do If %%~zA LSS %min.size% del "%%A"

:: Open folder 
start .