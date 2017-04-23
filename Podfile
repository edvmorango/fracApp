platform :ios, '8.0'
use_frameworks!
source 'https://github.com/CocoaPods/Specs.git'


# Whatever pods you need for your app go here

def testing_pods 

	pod 'Quick'
	pod 'Nimble'
	pod 'RxBlocking'
	pod 'RxTest'
end

target 'fracApp' do
	use_frameworks!
	pod 'RxSwift'
	pod 'RxCocoa'
	pod 'Alamofire'
	pod 'Moya/RxSwift', '~> 8.0.3'
	pod 'SDWebImage'
	pod 'Gloss'
end


target 'fracAppTests' do
	inherit! :search_paths
	testing_pods
end

target 'fracAppUITests' do
	inherit! :search_paths
	testing_pods
end
