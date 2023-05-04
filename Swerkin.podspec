#
# Be sure to run `pod lib lint Swerkin.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Swerkin'
  s.version          = '0.0.1'
  s.summary          = 'Library that contains the core components for UI Testing with KIF and Gherkin'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Library to facilitate UI testing utilizing KIF.  It is to be shared across apps and contains the base components for building basic UI tests.  It uses the screen object model design as well as the XCTest framework to create UI tests that are quick and easy to setup.
                       DESC

  s.homepage         = 'https://github.com/Progressive-Insurance/Swerkin'
  
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = {  }
  s.source           = { :git => 'https://github.com/Progressive-Insurance/Swerkin.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'
  s.pod_target_xcconfig = { 'ENABLE_BITCODE' => 'NO' }
  s.swift_version = '5.0'

  s.source_files = ['Sources/Swerkin/Classes/**/*.{swift,c,h,m,mm}', 'Sources/SwerkinAdditions/**/*.{swift,c,h,m,mm}']

  s.public_header_files = 'Sources/SwerkinAdditions/**/*.h'

  s.frameworks = 'UIKit', 'XCTest'
  s.dependency 'KIF'
  s.dependency 'KIF/IdentifierTests'
end
