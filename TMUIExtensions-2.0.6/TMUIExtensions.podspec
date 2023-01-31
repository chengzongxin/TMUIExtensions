Pod::Spec.new do |s|
  s.name = "TMUIExtensions"
  s.version = "2.0.6"
  s.summary = "TMUIKit \u662F\u4E2AUI\u5E93\uFF0C\u5305\u542BUI\uFF0C\u7EC4\u4EF6\uFF0C\u5B8F\uFF0C\u5E93\u5DE5\u5177\u7B49\u3002"
  s.license = {"type"=>"MIT", "file"=>"LICENSE"}
  s.authors = {"chengzongxin"=>"joe.cheng@corp.to8to.com"}
  s.homepage = "https://github.com/chengzongxin/TMUIExtensions.git"
  s.description = "'TMUIKit iOS \u662F\u4E00\u4E2A\u81F4\u529B\u4E8E\u63D0\u9AD8\u9879\u76EE UI \u5F00\u53D1\u6548\u7387\u7684\u7EC4\u4EF6\u5E93\uFF0C\u4E3A\u5DE5\u7A0B\u63D0\u4F9B\u4E00\u4E9B\u901A\u7528\u7684UI\u57FA\u7840\u5E93\u53CA\u529F\u80FD\u7EC4\u4EF6\u5E93\u4EE5\u53CA\u4E00\u4E9B\u901A\u7528\u7684\u5DE5\u5177\u5E93\u3002\n\u65E8\u5728\u5E2E\u52A9\u5FEB\u901F\u9AD8\u6548\u7684\u6784\u5EFA\u5DE5\u7A0B\u7684\u57FA\u7840\u8BBE\u8BA1\u5143\u7D20\uFF0C\u4EE5\u53CA\u7EDF\u4E00\u7EF4\u62A4\u57FA\u7840\u5143\u7D20\u7684\u7248\u672C\u517C\u5BB9\u6027\u5904\u7406\uFF0C\u52A9\u4E8E\u63D0\u9AD8\u5F00\u53D1\u6548\u7387\u548C\u9879\u76EE\u8D28\u91CF\u3002'"
  s.frameworks = ["Foundation", "UIKit", "CoreGraphics"]
  s.requires_arc = true
  s.source = { :path => '.' }

  s.ios.deployment_target    = '9.0'
  s.ios.vendored_framework   = 'ios/TMUIExtensions.embeddedframework/TMUIExtensions.framework'
end
