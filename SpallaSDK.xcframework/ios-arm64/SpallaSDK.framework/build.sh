xcodebuild archive -workspace SpallaWorkspace.xcworkspace -scheme SpallaSDK -destination "generic/platform=iOS" -archivePath archives/SpallaFramework-iOS
xcodebuild archive -workspace SpallaWorkspace.xcworkspace -scheme SpallaSDK -destination "generic/platform=iOS Simulator" -archivePath archives/SpallaFramework-iOS_Simulator

xcodebuild -create-xcframework -archive archives/SpallaFramework-iOS.xcarchive -framework SpallaSDK.framework -archive archives/SpallaFramework-iOS_Simulator.xcarchive -framework SpallaSDK.framework -output xcframeworks/SpallaSDK.xcframework
