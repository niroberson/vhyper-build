Visual C++ Redistributable for Visual Studio 2015 is required to run this
application. So, if you receive the error "pyi_rth_qt5plugins returned -1"
trying to run the gui, try installing vc_redist.x64.exe and then run it again.

In order to generate a .py file from a .ui file, install PyQt5 and run:
`python -m PyQt5.uic.pyuic input.ui > output.py`

To create a single .exe file from all of the python + Qt madness, install PyInstaller and run:
`pyinstaller -wF main.py`
