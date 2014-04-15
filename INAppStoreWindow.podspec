Pod::Spec.new do |s|
    s.name          = "INAppStoreWindow"
    s.version		    = "1.4"
    s.summary		    = "Mac App Store style NSWindow subclass."
    s.homepage	    = "https://github.com/indragiek/INAppStoreWindow"
    s.author		    = { "Indragie Karunaratne" => "i@indragie.com" }
    s.source		    = { :git => "https://github.com/indragiek/INAppStoreWindow.git", :tag => "v#{s.version}" }
    s.platform      = :osx
    s.requires_arc  = true
    s.license       = { :type => "BSD", :text => "INAppStoreWindow is licensed under the BSD license."}
    
    s.default_subspec = "Core"

    s.subspec "Core" do |sp|
      sp.requires_arc   = true
      sp.source_files   = "INAppStoreWindow/*.{m.h}"
      sp.exclude_files  = "Extensions/*"
    end
    
    s.subspec "SwizzlyFun" do |sp|
      sp.dependency "INAppStoreWindow/Core"
      
      sp.requires_arc = true
      sp.source_files = "Extensions/INAppStoreWindowSwizzling.{c,h}"
    end
    
    s.subspec "INTitlebarView+CoreUIRenderer" do |sp|
      sp.dependency "INAppStoreWindow/SwizzlyFun"
      
      sp.requires_arc	= true
      sp.source_files = "Extensions/INTitlebarView+CoreUIRenderer.{m,h}"
    end
    
    s.subspec "NSDocument+INAppStoreWindowFixes" do |sp|
      sp.dependency "INAppStoreWindow/SwizzlyFun"
      
      sp.requires_arc	= true
      sp.source_files = "Extensions/NSDocument+INAppStoreWindowFixes.{m,h}"
    end
end
