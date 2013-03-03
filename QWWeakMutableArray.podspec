Pod::Spec.new do |s|
 s.name         = 'QWWeakMutableArray'
 s.version      = '0.0.1'
 s.license      = 'MIT'
 s.summary      = 'Stores weak references to objects.'
 s.author       = { "normalcoder" => "normalcoder@gmail.com" }
 s.source       = { :git => 'https://github.com/normalcoder/QWWeakMutableArray.git', :tag => s.version.to_s }
 s.source_files = '*.{h,m}'
 s.requires_arc = true
 s.homepage     = 'https://github.com/normalcoder/QWWeakMutableArray'
end
