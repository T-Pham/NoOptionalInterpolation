Pod::Spec.new do |s|
  s.name             = 'NoOptionalInterpolation'
  s.version          = '0.1.0'
  s.summary          = 'NoOptionalInterpolation make "Optional(...)" no longer be printed out in Swift string interpolation.'
  s.description      = <<-DESC
I know your struggles.
NoOptionalInterpolation make "Optional(...)" no longer be printed out in Swift string interpolation.
                       DESC
  s.homepage         = 'https://github.com/T-Pham/NoOptionalInterpolation'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Thanh Pham' => 'minhthanh@me.com' }
  s.source           = { :git => 'https://github.com/T-Pham/NoOptionalInterpolation.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'NoOptionalInterpolation/Classes/**/*'
end
