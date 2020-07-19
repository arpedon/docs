@ECHO OFF

pushd %~dp0

REM Command file for Sphinx documentation

if "%SPHINXBUILD%" == "" (
	set SPHINXBUILD=sphinx-build
)
set SOURCEDIR=source
set BUILDDIR=build

if "%1" == "" goto help

if "%1" == "htmlall" goto htmlall

%SPHINXBUILD% >NUL 2>NUL
if errorlevel 9009 (
	echo.
	echo.The 'sphinx-build' command was not found. Make sure you have Sphinx
	echo.installed, then set the SPHINXBUILD environment variable to point
	echo.to the full path of the 'sphinx-build' executable. Alternatively you
	echo.may add the Sphinx directory to PATH.
	echo.
	echo.If you don't have Sphinx installed, grab it from
	echo.http://sphinx-doc.org/
	exit /b 1
)

%SPHINXBUILD% -M %1 %SOURCEDIR% %BUILDDIR% %SPHINXOPTS% %O%
goto end

:htmlall
rmdir /q /s build\html
mkdir build\html\en build\html\el

echo.%SPHINXBUILD% -M html %SOURCEDIR% %BUILDDIR% -D language=\"en\" %O%
%SPHINXBUILD% -M html %SOURCEDIR% %BUILDDIR% -D language="en" %O%
echo.Build English

robocopy .\%BUILDDIR%\html .\%BUILDDIR%\html\en\ /E /MIR
echo.Copied english translations to %BUILDDIR%/html/en/

set SPHINXOPTS = "-D language='el'"
echo.Reset sphinxopts

%SPHINXBUILD% -M html %SOURCEDIR% %BUILDDIR% %SPHINXOPTS% %O%

robocopy .\%BUILDDIR%\html .\%BUILDDIR%\html\el\ /E /MIR

echo.Build Greek
goto end

:help
%SPHINXBUILD% -M help %SOURCEDIR% %BUILDDIR% %SPHINXOPTS% %O%

:end
popd
