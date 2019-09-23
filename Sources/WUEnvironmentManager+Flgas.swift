import UIKit

public extension WUManagerEnvironment {
    // MARK: Public Methods
    
    /// 1) If it's production, just production can be selected
    /// 2) If there's any preference stored, return what's stored.
    /// 3) If no preference is set, return the default build (check for custom flags)
    
    class var currentEnvironment: WUEnvironment {
        /// 1) If it's production, just production can be selected
        #if CONFIGURATION_Release
            return .production
        #endif
        
        /// 2) If there's any preference stored, return what's stored.
        if let environment = getStoredEnvironment() {
            return environment
        }
        
        /// 3) If no preference is set, return the default build (check for custom flags)
        #if CONFIGURATION_Debug
            return .development
            
        #elseif CONFIGURATION_Adhoc
            return .staging
            
        #elseif CONFIGURATION_Release
            return .production
            
        #elseif CONFIGURATION_Demo
            return .demo
            
        #else
            return .production
        #endif
    }
    
    static var isDevelopment: Bool {
        return currentEnvironment == .development
    }
    
    static var isStaging: Bool {
        return currentEnvironment == .staging
    }
    
    static var isDemo: Bool {
        return currentEnvironment == .demo
    }
    
    static var isProduction: Bool {
        return currentEnvironment == .production
    }
    
    static var isTest: Bool {
        return NSClassFromString("XCTest") != nil
    }
    
    static var isDebugFlag: Bool {
        #if CONFIGURATION_Debug
            return true
        #else
            return false
        #endif
    }
    
    static var isAdhocFlag: Bool {
        #if CONFIGURATION_Adhoc
            return true
        #else
            return false
        #endif
    }
    
    static var isReleaseFlag: Bool {
        #if CONFIGURATION_Release
            return true
        #else
            return false
        #endif
    }
}
