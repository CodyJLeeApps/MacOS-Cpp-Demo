#!/bin/sh
export WORKING_DIR=$PWD
export BUILD_RES=$WORKING_DIR/build_resources
export SCRIPTS=$WORKING_DIR/build_scripts
export OUTPUT=$WORKING_DIR/output
export APP=MacOS-Cpp-Demo.app
export APP_CONTENTS=$OUTPUT/$APP/Contents
export APP_RES=$APP_CONTENTS/Resources
export MACDEPLOYQT=/Users/cody/Qt5.9.1/5.9.1/clang_64/bin/macdeployqt

export ICON=PF_Icon.icns
export PLIST=Info.plist
export JDK=pf_jdk_mac.zip
export APPRUNNER=apprunner
export APPRUNNER_SH=build_apprunner.sh
export PFJAR=proctorfree.jar
export PFJAR_SH=build_pf_jar.sh
export DMG_SH=build_pf_dmg.sh
export MACFLDR=__MACOSX

echo 
echo "***** Build PF MacOS Application Script *****"
echo "Creating Application Archive..."
rm -rf $OUTPUT/*
mkdir $OUTPUT/$APP

echo ".."
echo ".."
echo "Filling App Structure"
cd $OUTPUT/$APP
mkdir Contents
mkdir Contents/MacOS
mkdir Contents/Resources

echo ".."
echo ".."
echo "Unzipping / Placing JDK"
unzip $BUILD_RES/$JDK -d $APP_CONTENTS
rm -rf $APP_CONTENTS/$MACFLDR


echo ".."
echo ".."
echo "Placing Plist and Icon Files"
cp $BUILD_RES/$PLIST $APP_CONTENTS
cp $BUILD_RES/$ICON $APP_RES

echo ".."
echo ".."
echo "Calling build_apprunner.sh"
/bin/bash $SCRIPTS/$APPRUNNER_SH
cp $OUTPUT/$APPRUNNER $APP_CONTENTS/MacOS

echo ".."
echo ".."
echo "Calling build_pf_jar.sh"
/bin/bash $SCRIPTS/$PFJAR_SH
cp $OUTPUT/$PFJAR/*.jar $APP_RES

echo ".."
echo ".."
echo "Building the AppRunner items for Release:"
$MACDEPLOYQT $OUTPUT/$APP

echo ".."
echo ".."
echo "Building the Final DMG for Deployment"
/bin/bash $SCRIPTS/$DMG_SH