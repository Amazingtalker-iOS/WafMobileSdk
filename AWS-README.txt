== Installation of WAF Mobile SDK to local Cocoapods ==

1. Create a new directory for storing local WafMobileSdk pod (ex: ~/cocoapods/WafMobileSdk)
2. Unzip/untar the `WafMobileSdk` archive and move WafMobileSdk.podspec and WafMobileSdk.xcframework to the newly created directory 
3. Modify existing Podfile by adding WafMobileSdk pod dependency (ex: pod 'WafMobileSdk', :path => '~/cocoapods/WafMobileSdk')
4. Run pod install and open app's xcworkspace

== Installation of WAF Mobile SDK to Swift Package Manager ==

For swift package manager, all the change needed is to follow [documentation](https://developer.apple.com/documentation/xcode/distributing-binary-frameworks-as-swift-packages.) and add this binary target:
```
.binaryTarget(
    name: "WafMobileSdk",
    path: "WafMobileSdk.xcframework"
)
```

== Installation of WAF Mobile SDK to Carthage Package Manager ==

Note: We highly encourage leveraging Cocoapods or Swift Package Manager for streamlined dependency management. However, if Carthage is your preferred choice, here is an outline of the process.

To integrate our binary bundle seamlessly with Carthage, ensure it's placed within the correct directory structure (`Carthage/Build`). This allows Carthage to effortlessly incorporate the xcframework bundle into the app's search paths.

Here's a summary of key steps:
1. Update your project to link and embed XCFrameworks from Carthage/Build. Extract the framework from `CONFIGURATION_BUILD_DIR`. Note that this approach may not be compatible with users not utilizing the `--use-xcframeworks` flag, potentially requiring alternative strategies. Exercise caution, and consider versioning this as a breaking change.
2. If Carthage encounters issues while building a scheme containing non-framework targets, consider splitting it into multiple schemes, ensuring Carthage only builds the framework targets.
3. Adjust your build phases to dynamically parse the `FRAMEWORK_SEARCH_PATHS` build setting, searching each directory to locate the Carthage framework, rather than hard-coding its path to a specific `Carthage/Build/<platform>` directory.

For further assistance, refer to additional resources such as the discussion on GitHub:
https://github.com/Carthage/Carthage/issues/3121#issuecomment-772302196

== Dependencies ==
Minimum supported XCode version for the IOS SDK is `16.0`.

Additional notes :
- It's recommended to enable "Build Libraries for Distribution" and set NO to build only active arch. To do this in Podfile,

```
  post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
            config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
        end
    end
  end
```

== tvOS support ==
- The SDK supports tvOS, enabling integration with Apple TV apps.
- Note that while the SDK supports tvOS as well, some libraries and features avaible in iOS may differ in their support or behavior on tvOS.
  Please check the [Apple developer documentation](https://developer.apple.com/documentation/tvos-release-notes) for details on these differences.
