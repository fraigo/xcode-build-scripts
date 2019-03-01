#!/bin/bash

# Project filename (PROJECT.xcproject or PROJECT.xcworkspace)
PROJECT="MyApplication"

# Scheme is the target name in your project. Default is the same project name
SCHEME="MyApplication"

# name for the archive and .ipa file
IPA_FILE="myapp"
# destination folder for .xcarchive and .ipa
TARGET_FOLDER="./build"

# building app
echo "Building..."
if [ -e "$PROJECT.xcworkspace/" ]; then
    xcodebuild -workspace "$WORKSPACE.xcworkspace/" -scheme "$SCHEME" -destination generic/platform=iOS build > /dev/null
else;
    xcodebuild -project "$PROJECT.xcproject/" -scheme "$SCHEME" -destination generic/platform=iOS build > /dev/null
fi

# archiving 
echo "Archiving..."
if [ -e "$PROJECT.xcworkspace/" ]; then
    xcodebuild -workspace "$WORKSPACE.xcworkspace/" -scheme "$SCHEME" -sdk iphoneos -configuration AppStoreDistribution archive -archivePath $TARGET_FOLDER/$IPA.xcarchive > /dev/null
else;
    xcodebuild -project "$PROJECT.xcproject/" -scheme "$SCHEME" -sdk iphoneos -configuration AppStoreDistribution archive -archivePath $TARGET_FOLDER/$IPA.xcarchive > /dev/null
fi

# create .ipa
echo "Generating .ipa..."
mkdir -p $TARGET_FOLDER
xcodebuild -exportArchive -archivePath $TARGET_FOLDER/$IPA.xcarchive -exportOptionsPlist export-options.plist -exportPath $TARGET_FOLDER -allowProvisioningUpdates
mv "$TARGET_FOLDER/$SCHEME.ipa" "$TARGET_FOLDER/$IPA.ipa" && open $FOLDER

