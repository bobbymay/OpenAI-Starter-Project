import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL(url: String)
    case serverError
    
    var errorDescription: String? {
        switch self {
            case NetworkError.invalidURL(let url):
                return "NetworkError: The URL is invalid: \(url)"
            case .serverError:
                return "NetworkError: A server error occurred."
        }
    }
}

struct WebService {
    /**
     Creates a URLRequest object for sending a request to the OpenAI API endpoint specified in the endpoint parameter, with the given JSON data as the request body.
     
     - Parameters:
     - endpoint: An API endpoint (currently only .completions is supported) for which to create the URLRequest object.
     - jsonData: JSON data to include in the request body.
     - Returns: A URLRequest object that can be used to send a request to the OpenAI API endpoint.
     - Throws: A NetworkError.invalidURL error if the API endpoint URL is not valid.
     */
    static func createRequest(for endpoint: API.EndPoint, using jsonData: Data) throws -> URLRequest {
        let url: URL
        switch endpoint {
            case .completions:
                guard let endpoint = URL(string: API.EndPoint.completions.rawValue) else { 
                    throw NetworkError.invalidURL(url: API.EndPoint.completions.rawValue)
                }
                url = endpoint
                break
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = API.headers
        request.httpBody = jsonData
        return request
    }
    
    /**
     Fetches data from a given URL and returns it.
     
     - Parameters:
     - urlRequest: The URLRequest to post and fetch data from.
     - Throws: An error of type `NetworkError` if an issue occurs during the fetching process.
     - Returns: The Data that was fetched.
     */
    static func fetchData(from urlRequest: URLRequest) async throws -> Data {
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.serverError
        }
        
        return data
    }
    
}

