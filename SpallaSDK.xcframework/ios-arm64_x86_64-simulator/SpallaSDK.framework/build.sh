SCHEME_NAME="SpallaSDK"
FRAMEWORK_NAME="SpallaFramework"

xcodebuild archive -workspace SpallaWorkspace.xcworkspace -scheme SpallaSDK -sdk iphoneos -archivePath archives/SpallaFramework-iOS
xcodebuild archive -workspace SpallaWorkspace.xcworkspace -scheme SpallaSDK -sdk iphonesimulator -archivePath archives/SpallaFramework-iOS_Simulator
xcodebuild archive -workspace SpallaWorkspace.xcworkspace -scheme SpallaSDK -sdk iphonesimulator -archivePath archives/SpallaFramework-iOS_SimulatorArm -arch arm64


#create fat framework
#lipo -create \
./archives/SpallaFramework-iOS.xcarchive/Products/Library/Frameworks/SpallaSDK.framework/SpallaSDK \
  ./archives/SpallaFramework-iOS_Simulator.xcarchive/Products/Library/Frameworks/SpallaSDK.framework/SpallaSDK \
  -output ./archives/SpallaFramework-Simulator

#copy generated framework over the simulator one (kinda hacky)
#cp ./archives/SpallaFramework-Simulator ./archives/SpallaFramework-iOS_Simulator.xcarchive/Products/Library/Frameworks/SpallaSDK.framework/SpallaSDK

#xcodebuild -create-xcframework \
  -framework ./archives/SpallaFramework-iOS_Simulator.xcarchive/Products/Library/Frameworks/SpallaSDK.framework \
  -framework ./archives/SpallaFramework-iOS.xcarchive/Products/Library/Frameworks/SpallaSDK.framework \
  -output ./Products/SpallaFramework.xcframework

xcodebuild -create-xcframework \
-archive archives/SpallaFramework-iOS.xcarchive -framework SpallaSDK.framework \
-archive archives/SpallaFramework-iOS_Simulator.xcarchive -framework SpallaSDK.framework \
-archive archives/SpallaFramework-iOS_SimulatorArm.xcarchive -framework SpallaSDK.framework \
-output xcframeworks/SpallaSDK.xcframework
