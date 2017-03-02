#
# Be sure to run `pod lib lint KBVideoPlayer.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KBVideoPlayer'
  s.version          = '1.1'
  s.summary          = 'Highly customizable video player written in Swift'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: KBVideoPlayer is a simple iOS video player written in Swift that is highly customizable through storyboards!
                       DESC

  s.homepage         = 'https://github.com/kennybatista/KBVideoPlayer-ios'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'kennybatista' => 'kennybatista7@gmail.com' }
  s.source           = { :git => 'https://github.com/kennybatista/KBVideoPlayer-ios.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/kennybatista'

  s.ios.deployment_target = '8.0'

  s.resources = "KBVideoPlayer/Assets/*.{png}"
  s.source_files = 'KBVideoPlayer/ClassesAndViews/*.{swift,xib}'



  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
