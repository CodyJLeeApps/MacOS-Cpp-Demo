# MacOS-Cpp-Demo

This is a demo app that is used to show the ability to create a MacOS application from a C++ executable embedded within the \*.app package.

## Build Tools
* Basic text editor for shell scripts (I use [Visual Studio Code](https://code.visualstudio.com)).
* GCC Clang compiler (This is automatically installed when [XCode](https://developer.apple.com/xcode/) is installed on the system.)
* MacOS Terminal (I use [iTerm 2](https://www.iterm2.com) as my preffered Terminal)
* [iConvert Icons](https://iconverticons.com) I use this to quickly convert my PNG icons into .icns or other icon files.

## Getting Started

### MacOS Application Bundle

Before we begin I'd like to start by highlighting the MacOS requirements for a runnable "*.app".

See the following Apple Developer link to see the full description of an Application Bundle Structure. Listing 2-3 and Table 2-5 are both taken from the Apple Developer website.

[MacOS Bundle Structures](https://developer.apple.com/library/content/documentation/CoreFoundation/Conceptual/CFBundles/BundleTypes/BundleTypes.html#//apple_ref/doc/uid/10000123i-CH101-SW1)

![Basic Application Bundle](https://github.com/CodyJLeeApps/MacOS-Cpp-Demo/blob/master/readme_resources/Basic_App_Bundle.png)

In our example case the only folders we need to worry about are the following:

![Example Application Bundle](https://github.com/CodyJLeeApps/MacOS-Cpp-Demo/blob/master/readme_resources/Example_App_Bundle.png)

In this example we will only require one executable, but we could embed additional executable files within the application if our project requires it. I may do another tutorial on this subject at a later date, but feel free to contact me if you have questions regarding MacOS Application Bundles.

### Info.plist

All MacOS Bundle Structures require an Info.plist file to function properly within MacOS. The Info.plist file includes basic information about the app including, but not limited to: bundle identifier, supported platforms, copywrite information, etc. This information is used by MacOS requires to run the application. 

You can see this basic information below, some of them aren't strictly required, but I included them in the file as an example.

```markdown
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CFBundleDevelopmentRegion</key>
	<string>en</string>
	<key>CFBundleExecutable</key>
	<string>ex_apprunner</string>
	<key>CFBundleIconFile</key>
	<string>ex_icon.icns</string>
	<key>CFBundleInfoDictionaryVersion</key>
	<string>1.0</string>
	<key>CFBundleIdentifier</key>
	<string>com.codyjleeapps.development</string>
	<key>CFBundleName</key>
	<string>MacOS-Cpp-Demo</string>
	<key>CFBundlePackageType</key>
	<string>APPL</string>
	<key>CFBundleShortVersionString</key>
	<string>1.0.0.0</string>
	<key>CFBundleSignature</key>
	<string>CJL</string>
	<key>CFBundleSupportedPlatforms</key>
	<array>
		<string>MacOSX</string>
	</array>
	<key>NSHumanReadableCopyright</key>
	<string>Copyright ©2017 CodyJLeeApps, All rights reserved.</string>
	<key>LSApplicationCategoryType</key>
	<string>public.app-category.productivity</string>
	<key>LSMinimumSystemVersion</key>
	<string>10.6</string>
</dict>
</plist>
```

### Building and Running the Project

#### Directly Building the Application

Since this is an example project I created a "HelloWorld" executable that the application runs when opened. When the project is pulled down locally you can double-click the application to run directly.

#### Using the Build Script

I have created a bash script that does a few things:
1. Create the application bundle
2. Place application resources in bundle
3. Build the c++ executable
4. Place the executable in the bundle

You can run this script from the Terminal by running the following command within the project folder: "./build_scripts/build_app_archive.sh"

Once you run this script you can open the application directly by double-clicking the application bundle.

You should see the following output when you run the application:

![Example Output](https://github.com/CodyJLeeApps/MacOS-Cpp-Demo/blob/master/readme_resources/Example_App_Output.png)

Now that you have used the script to build the application you can modify the C++ executable as you see fit. Feel free to use the script to quickly build your own applications.

## Next Steps

The advantage to using C++ executables within the MacOS application bundle is the ability to have cross-platform compatible applications.

C++ is a cross-platform compatible language, but it does sometimes require platform specific routines to be ran. Of course the executable needs to be placed in a Windows specific installer, but the code base would be the same.

This is a subject for another discussion, but in general there are two options we could use to build a code base for cross platform compatibility.
1. Use "If Defined" statements to isolate platform specific sections of code 
```markdown
#if defined( Q_OS_WIN )
    // Perform Windows specific tasks here
#elif defined( Q_OS_MAC )
    // Perform MacOS specific tasks here
#endif
```
2. During project compilation platform specific source files can be compiled rather than combining the cross-platform code in one file.