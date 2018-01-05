# Uncomment the next line to define a global platform for your project
 platform :ios, '9.0'

target 'Tumblr' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  inhibit_all_warnings!
  
pod 'RxSwift'
pod 'RxCocoa'
pod 'Alamofire'
pod 'SwiftyJSON'
pod 'SnapKit'
pod 'Kingfisher'
pod 'MJRefresh'
pod 'Reusable'
pod 'TMTumblrSDK'
pod 'ESTabBarController-swift'
pod 'CollectionKit'
end

post_install do |installer_representation|
    installer_representation.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
        end
    end
end
