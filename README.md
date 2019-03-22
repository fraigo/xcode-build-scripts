# xcode-build-scripts
Useful scripts for xcode : automated build, signing and deploy

## Requirements

* Xcode command line tools (specifically, `xcodebuild`)

## Usage

* Change the project name using the name of the .scodeproject or .xcworkspace file

`PROJECT="MyApplication"`

* Change the Scheme name using the name of the build from your application targets

`SCHEME="MyApplication"`

* Set the name for your .ipa file

`IPA_FILE="myapp"`

* set a target (sub)folder to store .ipa file and generated files from `xcodebuild`

`TARGET_FOLDER="./build"`
