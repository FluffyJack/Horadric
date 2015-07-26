Pod::Spec.new do |s|

  s.name         = "Horadric"
  s.version      = "0.0.3"
  s.summary      = "Combine your development skills to build something great"

  s.description  = <<-DESC
                   A longer description of Horadric in Markdown format.

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC

  s.homepage     = "http://www.prismatik.com.au"
  s.license      = { type: "MIT", file: "LICENSE" }
  s.author             = { "Jack Dean Watson-Hamblin" => "info@fluffyjack.com" }
  s.social_media_url   = "http://twitter.com/FluffyJack"

  s.platform     = :ios
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/FluffyJack/Horadric.git", :tag => s.version }

  s.source_files  = "Horadric/**/*.{swift}"
  s.exclude_files = "Horadric/Exclude", "Horadric/HoradricTests"

  s.framework  = "WebKit"
  s.requires_arc = true

end
