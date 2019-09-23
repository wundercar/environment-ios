import Foundation

public class WUManagerEnvironment {
    // MARK: Properties
    
    static let kWUEnvironment = "kWUEnvironment" // User Defaults key
}

// MARK: Public Methods

public extension WUManagerEnvironment {
    class var availableEnvironments: [WUEnvironment] {
        return [
            WUEnvironment.development,
            WUEnvironment.staging,
            WUEnvironment.demo,
            WUEnvironment.production
        ]
    }
    
    class func getStoredEnvironment() -> WUEnvironment? {
        guard let environment = UserDefaults.standard.string(forKey: kWUEnvironment) else {
            return nil
        }
        let result = WUEnvironment(from: environment)
        return result
    }
    
    class func changeEnvironmentTo(_ environment: WUEnvironment) {
        UserDefaults.standard.set(environment.toRaw, forKey: kWUEnvironment)
    }
    
    class func clearEnvironments() {
        UserDefaults.standard.removeObject(forKey: kWUEnvironment)
    }
}
