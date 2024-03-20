//
//  RandomFunc.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 19/03/24.
//

/// Returns a pseudo-random float between from and to (inclusive).
public struct RandomFunc: FunctionResultHandling {
    public static let name: String = "random"
    
    public static func handle(parameters: [CallParameter]) throws -> Value {
        guard !parameters.isEmpty else { throw FunctionError.missingArgument(parameter: "from") }
        guard parameters.count > 1 else { throw FunctionError.missingArgument(parameter: "to") }
        guard parameters.count == 2 else { throw FunctionError.extraArgument }
        
        let from = parameters[0].value
        let to = parameters[1].value
        
        guard from.type.isNumber else { throw FunctionError.typeError(parameterType: from.type, expectedType: .number) }
        guard to.type.isNumber else { throw FunctionError.typeError(parameterType: to.type, expectedType: .number) }
        
        switch highestOrder(from, to) {
        case .bool, .int:
            return Value(int: Int.random(in: from.asInteger...to.asInteger))
        case .float:
            return Value(float: Float.random(in: from.asFloat...to.asFloat))
        case .double:
            return Value(double: Double.random(in: from.asDouble...to.asDouble))
        default:
            fatalError("Random function failed. Reason: unsupported operation for \(highestOrder(from, to)) type")
        }
    }
}
