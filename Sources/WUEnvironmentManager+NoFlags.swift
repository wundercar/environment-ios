import UIKit

//
// Methods that don't require variables or configuration
//
public extension WUManagerEnvironment {
    class var isDevelopmentNoConfig: Bool {
        // Check: This is not documented and it may stop working anytime.
        return _isDebugAssertConfiguration()
    }
    
    class var isProductionNoConfig: Bool {
        // Check: This is not documented and it may stop working anytime.
        return _isFastAssertConfiguration()
    }
    
    class var isTestNoConfig: Bool {
        if ProcessInfo.processInfo.processName == "xctest" {
            return true
        }
        if let environment = ProcessInfo.processInfo.environment["XCInjectBundle"] {
            if environment.isEmpty == false {
                return true
            }
        }
        return NSClassFromString("XCTest") != nil
    }
    
    // This can't be detected without a preprocessor macro
    // class var isStagingNoConfig: Bool {}
    
    class var isUITestNoConfig: Bool {
        if ProcessInfo.processInfo.environment.keys.contains("UITests") {
            return true
        }
        if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil {
            return true
        }
        return false
    }
    
    class var isSnapshotNoConfig: Bool {
        if isUITestNoConfig == false {
            return false
        }
        
        #if FASTLANE_SNAPSHOT
            return true
        #endif
        
        return UserDefaults.standard.bool(forKey: "FASTLANE_SNAPSHOT")
    }
}
