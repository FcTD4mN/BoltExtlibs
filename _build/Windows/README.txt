::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                           README.TXT                             ::
::                                                                  ::
:: Last Update: 25/07/2018 22:44 GMT+1                              ::
:: Author(s): Unknown                                               ::
:: COPYRIGHT: BOLT 2018                                             ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
                          _           _ _   
                         | |         | | |  
                         | |__   ___ | | |_ 
                         | '_ \ / _ \| | __|
                         | |_) | (_) | | |_ 
                         |_.__/ \___/|_|\__|
                               _    _  _  _          
                    ___ __  __| |_ | |(_)| |__   ___ 
                   / _ \\ \/ /| __|| || || '_ \ / __|
                  |  __/ >  < | |_ | || || |_) |\__ \
                   \___|/_/\_\ \__||_||_||_.__/ |___/
                        C++ GAME ENGINE TOOLS            

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  This is the delegate build section in order to build the bolt core
and bolt editor external libraries. This repository is here to hold
and group these libraries together and delegate the build mechanisms.
  You probably want to go under Bolt/Windows and check README.txt
there first, however if you want to build Bolt Extlibs for your own
purposes the scripts can run standalone.
Just run buildall.bat from the regular windows command prompt in order
to build libraries and install them under the _install directory in
Extlibs root.
  It is strongly advised to turn off any anti-virus or firewall
software while running the setup.bat script.
You should never need to  browse directories or files starting with an
underscore '_' under the "_tools" directory, unless you want to add
new libraries and build scripts ( you can then refer to the file
RULES.txt, under the _tools directory )
  Reminder: Qt is not part of extlibs, you have to download the
binaries or build it yourself and follow the instructions for using Qt
Visual Studio Tools Extension.

Required:
  - 64bit machine
  - CMake 3.11.4 or greater
  - Git
  - Visual Studio 15 2017
  - Qt Visual Studio Tools Extension
  - Qt5.10 or greater Installation with prebuilt binaries for msvc2017_64

For more information and rules about integrating new libaries and new
scripted utilities for windows, check the file RULES.txt in the _tools
directory.

