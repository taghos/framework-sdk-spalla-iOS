Pod::Spec.new do |s|
    s.name          = 'SpallaSDK'
    s.version       = '2.6.3'
    s.summary       = 'Spalla Player with Analytics'
    s.homepage      = 'https://github.com/taghos/framework-sdk-spalla-iOS'
    s.license       = { :type => 'MIT' }
    s.author        = { 'SpallaSDK' => 'roja@bunker79.com' }
    s.source        = { :git => "https://github.com/taghos/framework-sdk-spalla-iOS.git", :tag => 'v2.6.3' }
    s.swift_version = '5.0'
    s.ios.deployment_target = '15.1'
    s.vendored_frameworks = 'SpallaSDK.xcframework'
    s.dependency 'THEOplayerSDK-core', '~> 10.8.0'
    s.dependency 'THEOplayer-Integration-GoogleCast', '~> 10.8.0'
    s.dependency 'THEOplayer-Integration-GoogleIMA', '~> 10.8.0'
    s.dependency 'GoogleAds-IMA-iOS-SDK', '~> 3.24.0'
    s.dependency 'Swifter', '~> 1.5.0'
  end
