import Foundation

struct API {
    #error("Enter your API key then delete this")
    static let key = "API_KEY"
    
    static let headers: [String: String] = [
        "Authorization": "Bearer \(API.key)",
        "Content-Type": "application/json"
    ]
    
    enum EndPoint: String {
        case completions = "https://api.openai.com/v1/completions"
    }
}

