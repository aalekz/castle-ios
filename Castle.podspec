#
# Be sure to run `pod lib lint Castle.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Castle'
  s.version          = '0.9.9'
  s.summary          = 'Castle SDK for iOS'

  s.description      = <<-DESC
Castle for iOS provides a simple way to integrate Castle into your app.
                       DESC

  s.homepage         = 'https://castle.io'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Timo Engelhardt' => 'timo@castle.io' }
  s.source           = { :git => 'https://github.com/castle/castle-ios.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.ios.frameworks = 'Security'

  s.source_files = 'Castle/Classes/**/*'
end


