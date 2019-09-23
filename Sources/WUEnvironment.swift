import Foundation

public enum WUEnvironment {
    case development
    case staging
    case production
    case demo
    case custom(url: String)
}

// MARK: - Public Methods

public extension WUEnvironment {
    var name: String {
        switch self {
        case .development:
            return "Development"
            
        case .staging:
            return "Staging"
            
        case .production:
            return "Production"
            
        case .demo:
            return "Demo"
            
        case .custom(let url):
            return "Custom: \(url)"
        }
    }
}

// MARK: - Equatable

extension WUEnvironment: Equatable {
    public static func == (lhs: WUEnvironment, rhs: WUEnvironment) -> Bool {
        switch (lhs, rhs) {
        case (.development, .development):
            return true
            
        case (.staging, .staging):
            return true
            
        case (.production, .production):
            return true
            
        case (.demo, .demo):
            return true
            
        case (.custom(let url1), .custom(let url2)):
            return url1 == url2
            
        default:
            return false
        }
    }
}
