import Foundation

extension WUEnvironment {
    var toRaw: String {
        switch self {
        case .development:
            return "development"
            
        case .staging:
            return "staging"
            
        case .production:
            return "production"
            
        case .demo:
            return "demo"
            
        case .custom(let url):
            return "Custom: \(url)"
        }
    }
    
    init(from raw: String) {
        switch raw {
        case "development":
            self = .development
            
        case "staging":
            self = .staging
            
        case "production":
            self = .production
            
        case "demo":
            self = .demo
            
        default:
            // Deal with custom case or return production as default
            let preffix = "Custom: "
            guard raw.contains(preffix) else {
                self = .production
                return
            }
            let url = raw.replacingOccurrences(of: preffix, with: "")
            self = .custom(url: url)
        }
    }
}
