Pod::Spec.new do |s|
  s.name             = 'NoOptionalInterpolation'
  s.version          = '1.0.2'
  s.summary          = 'Get rid of "Optional(...)" and "nil" in string interpolation.'
  s.description      = <<-DESC
NoOptionalInterpolation gets rid of "Optional(...)" and "nil" in Swift's string interpolation.
                       DESC
  s.homepage         = 'https://github.com/T-Pham/NoOptionalInterpolation'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Thanh Pham' => 'minhthanh@me.com' }
  s.source           = { :git => 'https://github.com/T-Pham/NoOptionalInterpolation.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.watchos.deployment_target = '2.0'
  s.source_files = 'NoOptionalInterpolation/Classes/**/*'
end
