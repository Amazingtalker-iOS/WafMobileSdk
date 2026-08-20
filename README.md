# AWS WAF Mobile SDK for iOS

AWS WAF Mobile SDK wrapper for AmazingTalker iOS app.

## Overview

This package wraps the [AWS WAF Mobile SDK](https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html) as a Swift Package Manager (SPM) binary target.

The SDK enables native iOS apps to obtain AWS WAF tokens without requiring JavaScript execution, allowing API domains to be protected by AWS WAF challenge rules.

## Installation

### Swift Package Manager

Add this package as a dependency in your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/Amazingtalker-iOS/waf_mobile_sdk.git", from: "1.1.0")
]
```

Or add it via Xcode:
1. File → Add Packages...
2. Enter repository URL: `https://github.com/Amazingtalker-iOS/waf_mobile_sdk.git`
3. Select version: `1.1.0` or later

## Usage

```swift
import WafMobileSdk

// Configure the SDK
let config = WAFConfiguration(
    applicationIntegrationUrl: URL(string: "https://<webacl-id>.edge.sdk.awswaf.com/...")!,
    domainName: "api.amazingtalker.com",
    backgroundRefreshEnabled: true
)

let provider = WAFTokenProvider(config)

// Get token
if let token = provider.getToken() {
    // Add token to API request headers
    request.setValue("aws-waf-token=\(token.value)", forHTTPHeaderField: "Cookie")
}
```

## Version

Current version: **1.1.0** (AWS WAF Mobile SDK 1.1.0)

## License

See [AWS-README.txt](./AWS-README.txt) for AWS WAF Mobile SDK license information.

## References

- [AWS WAF Mobile SDK Documentation](https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html)
- [AWS WAF Mobile SDK for iOS (Maven Central)](https://central.sonatype.com/artifact/software.amazon.waf/waf-mobile-sdk-ios)
