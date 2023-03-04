# OpenAI GPT-3 Language Model API Starter Project

This is a starter project that demonstrates how to use OpenAI's GPT-3 language model API to generate responses to prompts. The project includes a SwiftUI view that displays a text field for entering prompts and a button for generating responses. The view communicates with a view model class that uses async/await functions to send prompts to the API and retrieve responses.

## Getting Started

To use this project, you will need an OpenAI API key. You can sign up for an API key on the [OpenAI website](https://beta.openai.com/signup/).

Once you have an API key, you will need to set it in the `API` struct:

```swift
static let key = "API_KEY"
```
## Usage

Once you set your key. Build and run the project. 

Enter a prompt in the text field and click the "Generate" button to send the prompt to the OpenAI API and retrieve a response. The response will be displayed in the view.

## Contributing

If you have any suggestions or improvements for this project, feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
