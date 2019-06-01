#!/bin/bash

ROOT_DIR="$(pwd)"

source "$ROOT_DIR/Scripts/utils.sh"
source "$ROOT_DIR/Scripts/required-tools.sh"

OUTPUT_DIR="$ROOT_DIR/Output"
DERIVEDDATA_DIR="$HOME/ZIMGLoaderDerivedData"
PROJECT_NAME="ZIMGLoader"
PROJECT="$ROOT_DIR/$PROJECT_NAME.xcodeproj"
SDK="iphonesimulator12.2"
PLATFORM="platform=iOS Simulator,OS=12.2,name=iPhone 7"

createDirectory "$DERIVEDDATA_DIR"
createDirectory "$OUTPUT_DIR"

echo "Clean derived data..."
clearDataInDirectory "$DERIVEDDATA_DIR"

echo "Testing '$PROJECT_NAME' Started..."
set -o pipefail && xcodebuild \
	-project "$PROJECT" \
	-sdk "$SDK" \
	-destination "$PLATFORM" \
	-derivedDataPath "$DERIVEDDATA_DIR" \
	-scheme ZIMGLoader \
	build-for-testing test | xcpretty
echo "Testing finished"

echo "Archiving '$PROJECT_NAME' started..."
set -o pipefail && xcodebuild \
	-project "$PROJECT" \
	-sdk "$SDK" \
	-destination "$PLATFORM" \
	-derivedDataPath "$DERIVEDDATA_DIR" \
	-scheme ZIMGLoader \
	-configuration Release \
	build | xcpretty
clearDataInDirectory "$OUTPUT_DIR"
cp -r "$DERIVEDDATA_DIR/Build/Products/Release-iphonesimulator/" "$OUTPUT_DIR/"
echo "Archiving finished"