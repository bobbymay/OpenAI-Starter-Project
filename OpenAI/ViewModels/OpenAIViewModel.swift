import Foundation

/**
 A view model class for communicating with OpenAI's GPT-3 language model API using async/await functions.
 */
final class OpenAIViewModel: ObservableObject {
    /// A published property that holds the response from the AI language model.
    @Published var responds = ""
    
    /**
     A function that sends a prompt to OpenAI's GPT-3 language model API and retrieves a response. Uses async/await functions to communicate with the API and update the "responds" property with the response.
     
     - Parameters:
     - prompt: The prompt string to send to the API for generating a response.
     */
    func promptAI(_ prompt: String) async {
        
        let params: [String : Any] =  [
            "model": AIModels.davinci,
            "prompt": prompt,
            "max_tokens": 50,
        ]
        
        // Convert parameters to JSON data
        guard let jsonData = try? JSONSerialization.data(
            withJSONObject: params, 
            options: []) 
        else {
            return
        }
        
        do {
            // Create request and fetch data using async/await functions
            let request = try WebService.createRequest(for: .completions, using: jsonData)
            let data = try await WebService.fetchData(from: request)
            
            // Decode response data using JSONDecoder
            let decoder = JSONDecoder()
            let response = try decoder.decode(AIResponse.self, from: data)
            
            // Update "responds" property on main actor thread
            await MainActor.run {
                responds = response.choices[0].text
            }
        } catch let error as LocalizedError {
            print(error.errorDescription ?? "Error fetching data")
        } catch {
            print(error)
        }
        
    }
    
}

