import Foundation

struct AIResponse: Codable {
    let choices: [Choice]
    let created: Int
    let id: String
    let model: String
    let object: String
    let usage: Usage
}

struct Choice: Codable {
    let finish_reason: String
    let index: Int
    let logprobs: String?
    let text: String
}

struct Usage: Codable {
    let completion_tokens: Int
    let prompt_tokens: Int
    let total_tokens: Int
}

