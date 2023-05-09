cmake_minimum_required(VERSION 3.16)

project(Tap30pp VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appTap30pp
    src/main.cpp
)

qt_add_qml_module(appTap30pp
    URI Tap30pp
    VERSION 1.0
    QML_FILES qml/Main.qml
              qml/Splash.qml
              qml/App.qml
              qml/components/ImageButton.qml
              qml/components/RoundedImage.qml
              qml/components/ServiceItem.qml
    RESOURCES assets/tap30.png
)

set_target_properties(appTap30pp PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appTap30pp
    PRIVATE Qt6::Quick
)

install(TARGETS appTap30pp
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
