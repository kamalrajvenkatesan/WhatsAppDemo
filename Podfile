# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'
use_frameworks!
workspace 'WhatsApp'

target 'WhatsApp' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  pod 'RealmSwift'
  # Pods for WhatsApp

  target 'WhatsAppTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'WhatsAppUITests' do
    inherit! :search_paths
    # Pods for testing
  end

  # Submodule pods
  target 'Shared' do
    project 'Shared/Shared'
    pod 'RealmSwift'

end

end
