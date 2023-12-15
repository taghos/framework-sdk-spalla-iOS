Pod::Spec.new do |s|
    s.name          = 'SpallaSDK'
    s.version       = '0.6.0'
    s.summary       = 'Spalla Player with Analytics'
    s.homepage      = 'https://github.com/taghos/framework-sdk-spalla-iOS'
    s.license       = { :type => 'MIT' }
    s.author        = { 'SpallaSDK' => 'roja@bunker79.com' }
    s.source        = { :git => "https://github.com/taghos/framework-sdk-spalla-iOS.git", :tag => 'v0.6.0' }
    s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' } 
    s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
    s.swift_version = '5.0'
    s.ios.deployment_target = '13.0'
    s.vendored_frameworks = 'SpallaSDK.xcframework', 'GoogleCast.xcframework', 'THEOplayerSDK.xcframework'
    s.dependency 'GoogleAds-IMA-iOS-SDK', '3.18.5'
  end