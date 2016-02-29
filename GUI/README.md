Visual C++ Redistributable for Visual Studio 2015 is required to run this
application. So, if you receive the error `pyi_rth_qt5plugins returned -1`
trying to run the gui, try installing vc_redist.x64.exe and then run it again.

In order to generate a .py file from a .ui file, install PyQt5 and run:
```
python -m PyQt5.uic.pyuic input.ui > output.py
```

To create a single .exe file from all of the python + Qt madness, install PyInstaller and run:
```
pyinstaller -wF main.py
```

Resources
---------

- [Quick Setup + Intro to PyQt5](http://projects.skylogic.ca/blog/how-to-install-pyqt5-and-build-your-first-gui-in-python-3-4/)
- [Rapid GUI Programming with Python and Qt](https://www.cs.washington.edu/research/projects/urbansim/books/pyqt-book.pdf)
  - Textbook for PyQt4, but most things are the same
- [Signals and Slots for PyQt5](http://pyqt.sourceforge.net/Docs/PyQt5/signals_slots.html)
  - Very different from PyQt4
