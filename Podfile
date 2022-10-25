# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
use_frameworks!

workspace 'Brandol.xcworkspace'

target 'Brandol' do
  # Comment the next line if you don't want to use dynamic frameworks
  project 'Brandol.xcodeproj'

  # Pods for Brandol
  pod 'Kingfisher', '~> 5.0'
  
  target 'BrandolTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'BrandolUITests' do
    # Pods for testing
  end

end

target 'APIClient' do
  project 'APIClient/APIClient.xcodeproj'
  # Comment the next line if you don't want to use dynamic frameworks

  # Pods for APIClient

  target 'APIClientTests' do
    inherit! :search_paths
    # Pods for testing
  end

end

target 'HomeModule' do
  project 'HomeModule/HomeModule.xcodeproj'
  # Comment the next line if you don't want to use dynamic frameworks

  # Pods for HomeModule
  pod 'Kingfisher', '~> 5.0'
  
  target 'HomeModuleTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'HomeModuleApp' do
    inherit! :search_paths
    # Pods for testing
    pod 'Kingfisher', '~> 5.0'
  end
end

target 'ProductModule' do
  project 'ProductModule/ProductModule.xcodeproj'
  # Comment the next line if you don't want to use dynamic frameworks

  # Pods for ProductModule
  pod 'Kingfisher', '~> 5.0'

  target 'ProductModuleTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ProductModuleApp' do
    inherit! :search_paths
    # Pods for testing
    pod 'Kingfisher', '~> 5.0'
  end
  
  target 'ProductModuleAppTests' do
    inherit! :search_paths
    # Pods for testing
  end
  
  target 'ProductModuleAppUITests' do
    inherit! :search_paths
    # Pods for testing
  end
end
