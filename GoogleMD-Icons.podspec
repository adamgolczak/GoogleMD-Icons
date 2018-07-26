#
# Be sure to run `pod lib lint GoogleMD-Icons.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GoogleMD-Icons'
  s.version          = '1.0.0'
  s.summary          = 'Google Material Design Icons Library'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  s.swift_version = '>= 3.2, <= 4.0'
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/adamgolczak/GoogleMD-Icons'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'adamgolczak' => 'adam.golczak@gmail.com' }
  s.source           = { :git => 'https://github.com/adamgolczak/GoogleMD-Icons.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'GoogleMD-Icons/Classes/**/*'
  
   s.resource_bundles = {
     'GoogleMD-Icons' => ['GoogleMD-Icons/Assets/*.ttf']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
