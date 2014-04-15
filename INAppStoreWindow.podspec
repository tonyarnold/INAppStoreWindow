Pod::Spec.new do |s|
    s.name          = 'INAppStoreWindow'
    s.version       = '1.5'
    s.summary       = 'Mac App Store style NSWindow subclass.'
    s.homepage      = 'https://github.com/indragiek/INAppStoreWindow'
    s.author        = { 'Indragie Karunaratne' => 'i@indragie.com' }
    s.source        = { :git => 'https://github.com/indragiek/INAppStoreWindow.git', :tag => "v#{s.version}" }
    s.platform      = :osx
    s.requires_arc  = true
    s.license       = { :type => 'BSD', :text => 'INAppStoreWindow is licensed under the BSD license.'}
    
    s.default_subspec = 'Core'

    s.subspec 'Core' do |core|
      core.source_files = 'INAppStoreWindow/*.{h,m}'
      core.requires_arc = true
    end
    
    s.subspec 'Swizzling' do |swizzle|
      swizzle.dependency 'INAppStoreWindow/Core'
      
      swizzle.source_files = 'Extensions/INAppStoreWindowSwizzling.{c,h}'
      swizzle.requires_arc = true
    end
    
    s.subspec 'CoreUIRenderer' do |coreui|
      coreui.dependency 'INAppStoreWindow/Swizzling'
      
      coreui.source_files = 'Extensions/INTitlebarView+CoreUIRenderer.{m,h}'
      coreui.requires_arc = true
    end
    
    s.subspec 'NSDocumentFixes' do |docfixes|
      docfixes.dependency 'INAppStoreWindow/Swizzling'
      
      docfixes.source_files = 'Extensions/NSDocument+INAppStoreWindowFixes.{m,h}'
      docfixes.requires_arc = true
    end
end
