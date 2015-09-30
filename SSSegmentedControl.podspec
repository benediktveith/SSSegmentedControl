Pod::Spec.new do |s|
  s.name         = "SSSegmentedControl"
  s.version      = "0.2.0"
  s.summary      = "Multi Selection UISegmentedControl"

  s.description  = <<-DESC
                   * An extension for the UISegmentedControl
				   * Easy to have an multi selection UISegmentedControl
				   * Declare the max. number of active segments
				   * Easy coloring of active segments
				   * Full documented demo project and pod files
                   DESC

  s.homepage     = "https://github.com/benediktveith/SSSegmentedControl"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author    	 = "Benedikt Veith"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/benediktveith/SSSegmentedControl.git", :tag => "0.2.0" }
  s.source_files  = "SSSegmentedController/*.{h,m}"
end
