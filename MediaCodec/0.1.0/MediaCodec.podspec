#
# Be sure to run `pod lib lint MediaCodec.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MediaCodec'
  s.version          = '0.1.0'
  s.summary          = '视频编解码的三方库'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/meihuafeng/MediaCodec'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'meihuafeng' => 'freelancer.mhf@gmail.com' }
  s.source           = { :git => 'git@github.com:SmartIotDeviceSDK/mediaCodec-iOS.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'


  s.subspec 'ffmpeg' do |ffmpeg|
    ffmpeg.source_files = ['MediaCodec/MediaCodec/Classes/*.{swift,h,m,mm}']
    ffmpeg.preserve_paths = ['MediaCodec/MediaCodec/ffmpeg/include/**/*.{swift,h,m,mm}']
    ffmpeg.public_header_files = 'MediaCodec/MediaCodec/Classes/*.h'
  end

  s.subspec 'IJKMediaPlayer' do |ijkplayer|
    ijkplayer.source_files = ['MediaCodec/MediaCodec/IJKMediaPlayer/*.{h,mm,m}','MediaCodec/MediaCodec/IJKMediaPlayer/**/*.{h,mm,m,c}','MediaCodec/MediaCodec/ijkmedia/ijkplayer/ijkavformat/*.{h,c}','MediaCodec/MediaCodec/ijkmedia/ijkplayer/ijkavutil/*.{h,c,cpp}','MediaCodec/MediaCodec/ijkmedia/ijkplayer/pipeline/*.{h,c}','MediaCodec/MediaCodec/ijkmedia/ijkplayer/*.{h,c}','MediaCodec/MediaCodec/ijkmedia/ijksdl/*.{h,c}','MediaCodec/MediaCodec/ijkmedia/ijksdl/dummy/*.{h,c}','MediaCodec/MediaCodec/ijkmedia/ijksdl/ffmpeg/**/*.{h,c}','MediaCodec/MediaCodec/ijkmedia/ijksdl/gles2/**/*.{h,c,m}']
    #ijkplayer.private_header_files = ['MediaCodec/MediaCodec/IJKMediaPlayer/*.{h}']
    ijkplayer.public_header_files = ['MediaCodec/MediaCodec/IJKMediaPlayer/IJKMediaPlayback.h','MediaCodec/MediaCodec/IJKMediaPlayer/IJKMPMoviePlayerController.h','MediaCodec/MediaCodec/IJKMediaPlayer/IJKFFOptions.h','MediaCodec/MediaCodec/IJKMediaPlayer/IJKFFMoviePlayerController.h','MediaCodec/MediaCodec/IJKMediaPlayer/IJKAVMoviePlayerController.h','MediaCodec/MediaCodec/IJKMediaPlayer/IJKMediaModule.h','MediaCodec/MediaCodec/IJKMediaPlayer/IJKMediaPlayer.h','MediaCodec/MediaCodec/IJKMediaPlayer/IJKNotificationManager.h','MediaCodec/MediaCodec/IJKMediaPlayer/IJKKVOController.h','MediaCodec/MediaCodec/IJKMediaPlayer/IJKSDLGLViewProtocol.h','MediaCodec/MediaCodec/IJKMediaPlayer/IJKFFMonitor.h']
    ijkplayer.exclude_files = ['MediaCodec/MediaCodec/ijkmedia/ijkplayer/ijkavformat/ijkioandroidio.c','MediaCodec/MediaCodec/ijkmedia/ijkplayer/ijkavformat/ijkmediadatasource.c','MediaCodec/MediaCodec/ijkmedia/ijksdl/ijksdl_extra_log.h','MediaCodec/MediaCodec/ijkmedia/ijksdl/ijksdl_extra_log.c']
    ijkplayer.requires_arc = false
    ijkplayer.requires_arc = ['MediaCodec/MediaCodec/IJKMediaPlayer/*','MediaCodec/MediaCodec/IJKMediaPlayer/ijkmedia/ijkplayer/ios/pipeline/*','MediaCodec/MediaCodec/IJKMediaPlayer/ijkmedia/ijkplayer/ios/*','MediaCodec/MediaCodec/IJKMediaPlayer/ijkmedia/ijksdl/ios/*','MediaCodec/MediaCodec/ijkmedia/ijkplayer/ijkavformat/*','MediaCodec/MediaCodec/ijkmedia/ijkplayer/ijkavutil/*','MediaCodec/MediaCodec/ijkmedia/ijkplayer/pipeline/*','MediaCodec/MediaCodec/ijkmedia/ijkplayer/*','MediaCodec/MediaCodec/ijkmedia/ijksdl/*','MediaCodec/MediaCodec/ijkmedia/ijksdl/dummy/*','MediaCodec/MediaCodec/ijkmedia/ijksdl/ffmpeg/**/*','MediaCodec/MediaCodec/ijkmedia/ijksdl/gles2/**/*']
    
  end
  
  s.subspec 'TS2MP4' do |ts2mp4|
    ts2mp4.source_files = 'MediaCodec/MediaCodec/TS2MP4/*.{swift,h,mm,m}'
    ts2mp4.public_header_files = ['MediaCodec/MediaCodec/TS2MP4/ADMediaAssetExportSession.h','MediaCodec/MediaCodec/TS2MP4/KMMedia.h','MediaCodec/MediaCodec/TS2MP4/KMMediaAsset.h','MediaCodec/MediaCodec/TS2MP4/KMMediaFormat.h','MediaCodec/MediaCodec/TS2MP4/KMMediaAsset.h','MediaCodec/MediaCodec/TS2MP4/KMMediaAssetExportSession.h']
  end
  
  #三级目录
  s.subspec 'GPAC4iOS' do |gpac4ios|
    gpac4ios.source_files = 'MediaCodec/MediaCodec/GPAC4iOS/*.{swift,h,mm,m}'
    gpac4ios.private_header_files = 'MediaCodec/MediaCodec/GPAC4iOS/*.{h}'
  end

  podspecPath = File.dirname(__FILE__)
  
  s.vendored_libraries  = 'MediaCodec/MediaCodec/ffmpeg/lib/*.{a}','MediaCodec/MediaCodec/TS2MP4/*.{a}','MediaCodec/MediaCodec/GPAC4iOS/*.{a}'
  s.libraries =  'iconv', 'z'

  
  # 通过添加 -lssl 和 -lcrypto 链接标志，告诉链接器在链接 MediaCodec 模块时，要链接 libssl 和 libcrypto 这两个库。
  s.pod_target_xcconfig     = {
    'HEADER_SEARCH_PATHS' => [
    podspecPath + "/MediaCodec/MediaCodec/ffmpeg/include",
    podspecPath + "/MediaCodec/MediaCodec/ijkmedia",
    podspecPath + "/MediaCodec/MediaCodec/IJKMediaPlayer/ijkmedia"
    ],
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  
  s.dependency 'SmartDeviceCoreSDK'

end
