import XCTest
@testable import CalculatorApp

final class CalculatorAppTests: XCTestCase {
    
    func testAddition() {
        let result = evaluateExpression(expression: "2 + 3")
        XCTAssertEqual(result, "5")
    }
    
    func testSubtraction() {
        let result = evaluateExpression(expression: "10 - 4")
        XCTAssertEqual(result, "6")
    }
    
    func testMultiplication() {
        let result = evaluateExpression(expression: "3 * 3")
        XCTAssertEqual(result, "9")
    }
    
    func testDivision() {
        let result = evaluateExpression(expression: "8 / 2")
        XCTAssertEqual(result, "4")
    }

    func testInvalidInput() {
        let result = evaluateExpression(expression: "abc + 3")
        XCTAssertEqual(result, "Invalid Expression")
    }

    func testSpecialCharacters() {
        let result = evaluateExpression(expression: "5 + @")
        XCTAssertEqual(result, "Invalid Expression")
    }

    func testParentheses() {
        let result = evaluateExpression(expression: "(5 + 3) * 2")
        XCTAssertEqual(result, "16")
    }
}
