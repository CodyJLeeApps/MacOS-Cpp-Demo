# MacOS-Cpp-Demo

"This is a demo app that is used to show the ability to create a MacOS application from a C++ executable embedded within the \*.app package."

## Build Tools
* Basic text editor for the shell scripts.
* 

## Getting Started

### MacOS Application Archive

Before we begin I'd like to start by highlighting the MacOS requirements for a runnable "*.app".

See the following Apple Developer link to see the full description of an Application Bundle Structure.

[MacOS Bundle Structures](https://developer.apple.com/library/content/documentation/CoreFoundation/Conceptual/CFBundles/BundleTypes/BundleTypes.html#//apple_ref/doc/uid/10000123i-CH101-SW1)

![Basic Application Bundle](https://github.com/CodyJLeeApps/MacOS-Cpp-Demo.git/readme_resources/Basic_App_Bundle.png)

In our example case the only folders we care about are the following:

![Example Application Bundle](https://github.com/CodyJLeeApps/MacOS-Cpp-Demo.git/readme_resources/Example_App_Bundle.png)

The Info.plist file includes basic information about the application that MacOS requires to run the application. 

You can see this basic information below, some of them aren't strictly required, but I included them in the file just as an example.

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