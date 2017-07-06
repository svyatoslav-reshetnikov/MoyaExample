platform :ios, '9.0'

def app_pods
	pod 'ObjectMapper', '~> 2.2'
    pod 'Moya'
	pod 'Moya-ObjectMapper'
    pod 'Moya/RxSwift'
    pod 'Moya-ObjectMapper/RxSwift'
end

def test_pods
    pod 'Quick'
	pod 'Nimble'
end

target 'MoyaExample' do
  use_frameworks!
  app_pods

  # Pods for MoyaExample

  target 'MoyaExampleTests' do
    inherit! :search_paths
	app_pods
	test_pods
  end

end
