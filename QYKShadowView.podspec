Pod::Spec.new do |s|
  s.name             = 'QYKShadowView'
  s.version          = '1.2.0'
  s.summary          = 'An easy way to use shadow / cornerRadius'

  s.homepage         = 'https://github.com/yotrolz/QYKShadowView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yotrolz' => '207213149@qq.com' }

  s.source           = { :git => 'https://github.com/yotrolz/QYKShadowView.git', :tag => s.version.to_s }
  s.source_files = 'QYKShadowView/Classes/**/*'

  s.ios.deployment_target = '8.0'

  s.requires_arc = true
end
