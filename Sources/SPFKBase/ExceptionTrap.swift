// Copyright Ryan Francesconi. All Rights Reserved. Revision History at https://github.com/ryanfrancesconi/spfk-base

import SPFKBaseC

public enum ExceptionTrap {
    public static func withThrowing(_ block: @escaping (() throws -> Void)) throws {
        var swiftError: Error?

        // objc
        ExceptionCatcherOperation(
            {
                do {
                    try block()
                } catch {
                    swiftError = error
                }
            },
            { exception in
                Log.error(exception.name.rawValue, exception.reason)
                // Log.error(exception.callStackSymbols.joined(separator: "\n"))
                swiftError = exception.error
            }
        )

        if let swiftError {
            throw swiftError
        }
    }
}
