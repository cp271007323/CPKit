Pod::Spec.new do |s|

  s.name         = "CPKit"
  s.version      = "1.2.10"
  s.summary      = "自助框架"
  s.homepage     = "https://github.com/cp271007323/CPKit.git"
  s.license      = "MIT"
  s.author       = { "cp271007323" => "271007323@qq.com" }
  s.ios.deployment_target = "9.0"
  s.frameworks = "Foundation", "UIKit"
  s.dependency 'ReactiveObjC'
  s.dependency 'AFNetworking'
  s.dependency 'SDAutoLayout'
  s.dependency 'MJRefresh'
  s.dependency 'MJExtension'
  s.dependency 'CPNavgationController'
  s.source = { :git => "https://github.com/cp271007323/CPKit.git", :tag => s.version }
  s.source_files =  "CPKit" , "CPKit/*.{h.m}" , "CPKit/CPNetManager" , "CPKit/CPNetManager/*.{h.m}" , "CPKit/CPNetManager/CPNetRequest" , "CPKit/CPNetManager/CPNetRequest/*.{h.m}" , "CPKit/Base" , "CPKit/Base/*.{h.m}" , "CPKit/Category" , "CPKit/Category/*.{h.m}" , "CPKit/Views" , "CPKit/Views/*.{h.m}" 

end


