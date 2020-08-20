Pod::Spec.new do |s|
  s.name             = 'ResourceNetworking'
  s.version          = '0.1.0'
  s.summary          = 'Simple networking'
 
  s.description      = 'Simple networking'
 
  s.homepage         = 'https://github.com/Gwynblaid/ResourceNetworking'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sergey Kharchenko' => 'harchenkoss89@gmail.com' }
  s.source           = { :git => 'https://github.com/Gwynblaid/ResourceNetworking/', :tag => s.version.to_s }
 
  s.ios.deployment_target = '11.0'
  s.source_files = 'ResourceNetworking/Network/*.swift', 'ResourceNetworking/Protocols/*.swift', 'ResourceNetworking/Resource/*.swift'
 
end
