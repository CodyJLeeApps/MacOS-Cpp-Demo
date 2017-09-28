#!/bin/sh
export APP=MacOS-Cpp-Demo.app
export WORKING_DIR=$PWD
export BUILD_RES=$WORKING_DIR/build_resources
export SCRIPTS=$WORKING_DIR/build_scripts
export CPP_PROJECT=$WORKING_DIR/macos_exe_project
export OUTPUT=$WORKING_DIR/output
export APP_CONTENTS=$OUTPUT/$APP/Contents
export APP_RES=$APP_CONTENTS/Resources
export ICON=ex_icon.icns
export PLIST=Info.plist
export APPRUNNER=ex_apprunner
export APPRUNNER_SH=build_apprunner.sh

echo 
echo
echo "***** Build MacOS Application Bundle Script *****"
echo "..Creating Application Archive"
rm -rf $OUTPUT/*
mkdir $OUTPUT/$APP

echo ".."
echo ".."
echo "..Filling App Structure"
mkdir $OUTPUT/$APP/Contents
mkdir $OUTPUT/$APP/Contents/MacOS
mkdir $OUTPUT/$APP/Contents/Resources

echo ".."
echo ".."
echo "..Placing Plist and Icon Files"
cp $BUILD_RES/$PLIST $APP_CONTENTS/$PLIST
cp $BUILD_RES/$ICON $APP_RES/$ICON

echo ".."
echo ".."
echo "..Building C++ Project and Placing into Application Bundle"
g++ $CPP_PROJECT/HelloWorld.cpp -o $OUTPUT/ex_apprunner
cp $OUTPUT/$APPRUNNER $APP_CONTENTS/MacOS

echo ".."
echo ".."
echo "***** Build of application bundle is complete *****"