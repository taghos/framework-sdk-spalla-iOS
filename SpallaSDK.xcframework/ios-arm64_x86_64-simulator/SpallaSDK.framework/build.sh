SCHEME_NAME="SpallaSDK"
FRAMEWORK_NAME="SpallaFramework"

xcodebuild archive -workspace SpallaWorkspace.xcworkspace -scheme SpallaSDK -sdk iphoneos -archivePath archives/SpallaFramework-iOS
xcodebuild archive -workspace SpallaWorkspace.xcworkspace -scheme SpallaSDK -sdk iphonesimulator -archivePath archives/SpallaFramework-iOS_Simulator
xcodebuild archive -workspace SpallaWorkspace.xcworkspace -scheme SpallaSDK -sdk iphonesimulator -archivePath archives/SpallaFramework-iOS_SimulatorArm -arch arm64


xcodebuild -create-xcframework \
-archive archives/SpallaFramework-iOS.xcarchive -framework SpallaSDK.framework \
-archive archives/SpallaFramework-iOS_Simulator.xcarchive -framework SpallaSDK.framework \
-output xcframeworks/SpallaSDK.xcframework
