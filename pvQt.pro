##  qmake project for pvQt  ##
TEMPLATE = app
CONFIG += debug_and_release
CONFIG(debug, debug|release) {
     TARGET = pvQtd
} else {
     TARGET = pvQt
}

##  framework  ##
QT = gui core
QT += opengl

##  Directories  ##
DESTDIR = bin
OBJECTS_DIR = build
MOC_DIR = build
UI_DIR = build
win32 {
  INCLUDEPATH += c:/MinGW/include c:/MinGW/GnuWin32/include
}

## Source Files  ##
FORMS = ui/mainwindow.ui
HEADERS = src/pvQtPic.h
SOURCES = src/main.cpp src/pvQtPic.cpp
HEADERS += src/pvQtView.h src/MainWindow.h src/GLwindow.h
SOURCES += src/pvQtView.cpp src/MainWindow.cpp src/GLwindow.cpp
HEADERS += src/pvQt_QTVR.h 
SOURCES += src/pvQt_QTVR.cpp
FORMS += ui/picTypeDialog.ui
HEADERS += src/picTypeDialog.h
SOURCES += src/picTypeDialog.cpp src/pictureTypes.cpp
FORMS += ui/About.ui
HEADERS += src/About.h
SOURCES += src/About.cpp
HEADERS += src/quadsphere.h
SOURCES += src/quadsphere.cpp

##  Version  ##
# major.minor rev numbers are in version0.h
# patch = SVN version number, or ??? if unknown
HEADERS += version0.h SVNnoVersion.h version1.h
# capture SVN revision number in a file
!svn {
  system(svnversion -n > SVNversion.h ):CONFIG += svn
}
!svn {  # no SVN version available, use default
  message(could not run svnversion -- is it installed?)
  win32 {
    system(copy SVNnoVersion.h SVNversion.h)
  } else {
    system(cp SVNnoVersion.h SVNversion.h)
  }
}
# construct pvQtVersion.h
win32 {
  system(wbin\cat Version0.h SVNversion.h Version1.h > build\pvQtVersion.h)
} else {
  system(cat Version0.h SVNversion.h Version1.h  > build/pvQtVersion.h)
}
