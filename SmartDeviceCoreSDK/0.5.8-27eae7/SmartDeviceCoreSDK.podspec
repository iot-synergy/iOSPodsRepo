#
# Be sure to run `pod lib lint SmartDeviceCoreSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SmartDeviceCoreSDK'
  s.version          = '0.5.8-27eae7'
  s.summary          = 'smart device core sdk.'
  
  s.description      = <<-DESC
                        smart device core SDK
                       DESC

  s.homepage         = 'https://bitbucket-internal.addx.live/projects/SWCLIEN/repos/smartdevicecoresdk-ios/browse'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'meihuafeng' => 'hmei@a4x.io' }
  s.source           = { :git => 'ssh://git@bitbucket-internal.addx.live:7999/swclien/smartdevicecoresdk-ios.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.swift_version = '5.1'
  
  s.subspec 'Source' do |source|
    
    source.source_files = 'SmartDeviceCoreSDK/Source/*.h'
    
    source.subspec 'SmartBaseSDK' do |ss|
      
      ss.subspec 'BaseConfig' do |sss|
        sss.source_files = 'SmartDeviceCoreSDK/Source/SmartBaseSDK/A4xBaseConfig/*.{swift,h,m,mm}'
      end
      
      ss.subspec 'BaseInterface' do |sss|
        sss.source_files = 'SmartDeviceCoreSDK/Source/SmartBaseSDK/A4xBaseInterface/*.{swift,h,m,mm}'
      end
      
      ss.subspec 'BaseManagers' do |sss|
        sss.source_files = 'SmartDeviceCoreSDK/Source/SmartBaseSDK/A4xBaseManagers/*.{swift,h,m,mm}'
      end
      
      ss.subspec 'BaseModel' do |sss|
        sss.source_files = 'SmartDeviceCoreSDK/Source/SmartBaseSDK/A4xBaseModel/**/*.{swift,h,m,mm}'
      end
      
      ss.subspec 'BaseTools' do |sss|
        sss.source_files = 'SmartDeviceCoreSDK/Source/SmartBaseSDK/A4xBaseTools/**/*.{swift,h,m,mm}'
      end
      
      ss.subspec 'BaseViewModel' do |sss|
        sss.source_files = 'SmartDeviceCoreSDK/Source/SmartBaseSDK/A4xBaseViewModel/*.{swift,h,m,mm}'
      end
      
      ss.subspec 'UserDataHandle' do |sss|
        sss.source_files = 'SmartDeviceCoreSDK/Source/SmartBaseSDK/A4xUserDataHandle/**/*.{swift,h,m,mm}'
      end
      
      ss.subspec 'SDKInit' do |sss|
        sss.source_files = 'SmartDeviceCoreSDK/Source/SmartBaseSDK/BaseSDKInit/*.{swift,h,m,mm}'
      end
      
      ss.subspec 'Core' do |sss|
        sss.source_files = 'SmartDeviceCoreSDK/Source/SmartBaseSDK/Core/**/*.{swift,h,m,mm}'
      end
      
      ss.subspec 'Network' do |sss|
        sss.source_files = 'SmartDeviceCoreSDK/Source/SmartBaseSDK/Network/**/*.{swift,h,m,mm}'
      end
      
      ss.subspec 'Log' do |sss|
        sss.source_files = 'SmartDeviceCoreSDK/Source/SmartBaseSDK/Log/**/*.{swift,h,m,mm}'
      end
      
      ss.subspec 'Account' do |sss|
        sss.source_files = 'SmartDeviceCoreSDK/Source/SmartBaseSDK/Account/**/*.{swift,h,m,mm}'
      end
      
    end
    
    source.subspec 'SmartBindSDK' do |ss|
      ss.source_files = 'SmartDeviceCoreSDK/Source/SmartBindSDK/**/*.{swift,h,m,mm}'
    end
    
    source.subspec 'SmartDeviceManageSDK' do |ss|
      ss.source_files = 'SmartDeviceCoreSDK/Source/SmartDeviceManageSDK/**/*.{swift,h,m,mm}'
    end
    
    source.subspec 'SmartLibrarySDK' do |ss|
      ss.subspec 'LibraryCore' do |sss|
        sss.source_files = 'SmartDeviceCoreSDK/Source/SmartLibrarySDK/LibraryCore/*.{swift,h,m,mm}'
      end
      ss.subspec 'Download' do |sss|
        sss.source_files = 'SmartDeviceCoreSDK/Source/SmartLibrarySDK/Download/*.{swift,h,m,mm}'
      end
    end
    
    source.subspec 'SmartLiveSDK' do |ss|
      ss.subspec 'LivePlayer' do |sss|
        sss.source_files = 'SmartDeviceCoreSDK/Source/SmartLiveSDK/A4xPlayer/**/*.{swift,h,m,mm}'
      end
      ss.subspec 'ObjcWebRTC' do |sss|
        sss.source_files = 'SmartDeviceCoreSDK/Source/SmartLiveSDK/SmartWebRTC/ObjcWebRTC/**/*.{swift,h,m,mm}'
      end
      ss.subspec 'include' do |sss|
        sss.source_files = 'SmartDeviceCoreSDK/Source/SmartLiveSDK/SmartWebRTC/Frameworks/**/include/*.h'
      end
    end
  #
    source.vendored_frameworks = 'SmartDeviceCoreSDK/Source/SmartLiveSDK/SmartWebRTC/Frameworks/*.xcframework'
    source.vendored_libraries = 'SmartDeviceCoreSDK/Source/SmartLiveSDK/SmartWebRTC/Frameworks/**/*.a', 'SmartDeviceCoreSDK/Source/SmartBaseSDK/OpenSSL/libs/*.{a}'
    source.public_header_files = ['SmartDeviceCoreSDK/Source/SmartLiveSDK/SmartWebRTC/Frameworks/**/include/*.h', 'SmartDeviceCoreSDK/Source/*.h']
    source.pod_target_xcconfig     = {
      'OTHER_LDFLAGS' => ["$(inherited)", "-lssl", "-lcrypto", "-lc++"],
      'HEADER_SEARCH_PATHS' => [
        "SmartDeviceCoreSDK/Source/SmartLiveSDK/SmartWebRTC/Frameworks/A4xAudioMixer/include/",
        "SmartDeviceCoreSDK/Source/SmartLiveSDK/SmartWebRTC/Frameworks/A4xAudioPitch/include/",
        "SmartDeviceCoreSDK/Source/SmartLiveSDK/SmartWebRTC/Frameworks/A4xMediaKit/include/",
        "SmartDeviceCoreSDK/Source/SmartLiveSDK/SmartWebRTC/Frameworks/A4xSignal/include/",
        "SmartDeviceCoreSDK/Source/SmartLiveSDK/SmartWebRTC/Frameworks/A4xVodDataChannel/include/"
      ],
      'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES' # 设置 Build Library for Distribution 为 true
    }
    
    source.subspec 'Resources' do |ss|
      ss.resources = ['SmartDeviceCoreSDK/Source/*.json']
    end

  end
  
  s.subspec 'Binary' do |binary|
    binary.vendored_frameworks = 'SmartDeviceCoreSDK/Binary/*.xcframework'
  end
  
  
  s.default_subspecs = 'Binary'
  
  
end
