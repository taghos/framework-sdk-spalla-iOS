Pod::Spec.new do |s|
    s.name          = 'SpallaSDK'
    s.version       = '2.1.6'
    s.summary       = 'Spalla Player with Analytics'
    s.homepage      = 'https://github.com/taghos/framework-sdk-spalla-iOS'
    s.license       = { :type => 'MIT' }
    s.author        = { 'SpallaSDK' => 'roja@bunker79.com' }
    s.source        = { :git => "https://github.com/taghos/framework-sdk-spalla-iOS.git", :tag => 'v2.1.6' }
    s.swift_version = '5.0'
    s.ios.deployment_target = '14.0'
    s.vendored_frameworks = 'SpallaSDK.xcframework'
    s.dependency 'THEOplayerSDK-core', '~> 9.8.2'
    s.dependency 'THEOplayer-Integration-GoogleCast'
  end
