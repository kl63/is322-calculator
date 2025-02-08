import SwiftUI

// Function to evaluate math expressions safely
func evaluateExpression(expression: String) -> String {
    // Ensure expression contains only valid math characters
    let validCharacters = CharacterSet(charactersIn: "0123456789+-*/(). ")
    if expression.rangeOfCharacter(from: validCharacters.inverted) != nil {
        return "Invalid Expression"
    }
    
    let exp = NSExpression(format: expression)
    if let result = exp.expressionValue(with: nil, context: nil) as? NSNumber {
        return result.stringValue
    } else {
        return "Invalid Expression"
    }
}

struct ContentView: View {
    @State private var input = ""
    @State private var result = ""

    var body: some View {
        VStack {
            Text("Calculator App")
                .font(.largeTitle)
                .bold()

            TextField("Enter expression", text: $input)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.numbersAndPunctuation)

            Button("Calculate") {
                result = evaluateExpression(expression: input)
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)

            Text("Result: \(result)")
                .font(.title)
                .padding()

            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
