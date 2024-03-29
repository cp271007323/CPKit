Pod::Spec.new do |s|

  s.name         = "CPKit"
  s.version      = "1.5.2"
  s.summary      = "自用框架，可快速开发，满足普通开发的需求"
  s.homepage     = "https://github.com/cp271007323/CPKit.git"
  s.license      = "MIT"
  s.author       = { "cp271007323" => "271007323@qq.com" }
  s.ios.deployment_target = "11.0"
  s.frameworks = "Foundation", "UIKit"
  s.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }
  s.dependency 'ReactiveObjC'
  s.dependency 'SDAutoLayout'
  s.dependency 'YYKit'
  s.dependency 'MJRefresh'
  s.source = { :git => "https://github.com/cp271007323/CPKit.git", :tag => s.version }
  s.source_files =  "CPKit" , "CPKit/*.{h.m}" ,
 "CPKit/Base" , "CPKit/Base/*.{h.m}" ,
 "CPKit/CPKitManager" , "CPKit/CPKitManager/*.{h.m}" ,
 "CPKit/Views" ,"CPKit/Views/*.{h.m}",
 "CPKit/Views/CPFileTool", "CPKit/Views/CPFileTool/*.{h.m}" ,
 "CPKit/Views/CPCoverView", "CPKit/Views/CPCoverView/*.{h.m}" , 
 "CPKit/Views/CPAlertController", "CPKit/Views/CPAlertController/*.{h.m}" ,
 "CPKit/Views/CPUserDefaultTool", "CPKit/Views/CPUserDefaultTool/*.{h.m}" , 
 "CPKit/Views/CPRefresh", "CPKit/Views/CPRefresh/*.{h.m}" ,
 "CPKit/Views/CPShareController", "CPKit/Views/CPShareController/*.{h.m}" , 
 "CPKit/Views/CPLayoutBtn", "CPKit/Views/CPLayoutBtn/*.{h.m}" , 
 "CPKit/Views/CPBaseTextView", "CPKit/Views/CPBaseTextView/*.{h.m}" ,
 "CPKit/Views/CPHUDView", "CPKit/Views/CPHUDView/*.{h.m}" ,
 "CPKit/Category" , 
 "CPKit/Category/UIViewController+CP_Extension", "CPKit/Category/UIViewController+CP_Extension/*.{h.m}", 
 "CPKit/Category/NSString+Extension", "CPKit/Category/NSString+Extension/*.{h.m}", 
 "CPKit/Category/NSDate+CPDate", "CPKit/Category/NSDate+CPDate/*.{h.m}", 
 "CPKit/Category/UITextField+Extension", "CPKit/Category/UITextField+Extension/*.{h.m}", 
 "CPKit/Category/NSMutableAttributedString+Extension", "CPKit/Category/NSMutableAttributedString+Extension/*.{h.m}", 
 "CPKit/Category/UIView+CPFrame", "CPKit/Category/UIView+CPFrame/*.{h.m}", 
 "CPKit/Category/YYAnimatedImageView+PCN", "CPKit/Category/YYAnimatedImageView+PCN/*.{h.m}", 
 "CPKit/Category/UIImage+Extension", "CPKit/Category/UIImage+Extension/*.{h.m}", 
 "CPKit/Category/UIBarButtonItem+Extension", "CPKit/Category/UIBarButtonItem+Extension/*.{h.m}", 
 "CPKit/Category/UITableView_UICollectionView", "CPKit/Category/UITableView_UICollectionView/*.{h.m}", 
 "CPKit/Category/UITabBarController+Extension", "CPKit/Category/UITabBarController+Extension/*.{h.m}"

end


