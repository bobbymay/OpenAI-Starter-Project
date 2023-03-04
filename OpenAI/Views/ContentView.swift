import SwiftUI


struct ContentView: View {
    @State private var inputValue: String = ""
    @StateObject private var openAIViewModel = OpenAIViewModel()
    
    var body: some View {
        VStack(spacing: 25) {
            Spacer()
            Text(openAIViewModel.responds)
                .padding()
            Spacer()
            
            TextField("Enter text here",
                      text: $inputValue,
                      onCommit: submitText
            )
            .multilineTextAlignment(.center)
            .textFieldStyle(.roundedBorder)
            
            Button("Generate", action: submitText)
                .padding()
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(5)
            
            Spacer()
        }
    }
    
    func submitText() {
        Task {
            await openAIViewModel.promptAI(inputValue)
        }
    }

}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}


