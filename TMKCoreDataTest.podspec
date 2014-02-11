Pod::Spec.new do |s|
  s.name         = "TMKCoreDataTest"
  s.version      = "0.0.1"
  s.summary      = "Support on-memory persistent storage for CoreData"

  s.description  = <<-DESC
                   Support on-memory persistent storage for CoreData
                   DESC

  s.homepage     = "https://github.com/tmtk75/TMKCoreDataTest"
  s.license      = { :type => 'MIT', :file => 'LICENSE.txt' }
  s.author       = 'Tomotaka Sakuma'
  s.platform     = :ios, '5.0'
  s.source       = { :git => "https://github.com/tmtk75/TMKCoreDataTest.git", :tag => "0.0.1" }
  s.source_files  = 'TMKCoreDataTest', 'TMKCoreDataTest/**/*.{h,m}'
  s.exclude_files = 'Classes/Exclude'
end
