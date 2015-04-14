Pod::Spec.new do |s|
  s.name             = "Pages"
  s.summary          = "Pages is the easiest way of setting up a UIPageViewController."
  s.version          = "0.4.0"
  s.homepage         = "https://github.com/hyperoslo/Pages"
  s.license          = 'MIT'
  s.author           = { "Hyper" => "ios@hyper.no" }
  s.source           = { :git => "https://github.com/hyperoslo/Pages.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/hyperoslo'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Source/**/*'
end
