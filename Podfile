# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Eschoola' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Eschoola

pod 'MOLH'
pod 'ImageSlideshow', '~> 1.4'
pod 'IQKeyboardManagerSwift', '6.0.4'
pod 'Firebase/Core'
pod 'Firebase/Firestore'
pod "TTRangeSlider"
pod 'WormTabStrip', '~> 1.0'
pod "XMSegmentedControl"
pod 'SDWebImage', '~> 5.0'
pod 'BEMCheckBox'
pod 'CarbonKit'


post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings.delete('CODE_SIGNING_ALLOWED')
            config.build_settings.delete('CODE_SIGNING_REQUIRED')
        end
    end
    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end
end


  target 'EschoolaTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'EschoolaUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
