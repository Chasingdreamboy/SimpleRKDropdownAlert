#
# Be sure to run `pod lib lint SimpleRKDropdownAlert.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SimpleRKDropdownAlert'
  s.version          = '0.0.4'
  s.summary          = 'A short description of SimpleRKDropdownAlert.'


  s.description      = <<-DESC
The dropdown alert for SDK.
                       DESC

  s.homepage         = 'https://github.com/Chasingdreamboy/SimpleRKDropdownAlert'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'EriceWang' => 'wangerdong@treefinance.com.cn' }
  s.source           = { :git => 'https://github.com/Chasingdreamboy/SimpleRKDropdownAlert.git', :tag => s.version.to_s }
  

  s.ios.deployment_target = '8.0'
s.xcconfig = {'GENERATE_DEBUG_SYMBOLS' => 'NO'}
  s.source_files = 'SimpleRKDropdownAlert/RKDropdownAlert/*','SimpleRKDropdownAlert/RKDropdownAlert+Expand/*'
  s.public_header_files = 'SimpleRKDropdownAlert/RKDropdownAlert/*.h','SimpleRKDropdownAlert/RKDropdownAlert+Expand/*.h'
s.frameworks = 'UIKit'

end
