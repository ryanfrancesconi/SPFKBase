// Copyright Ryan Francesconi. All Rights Reserved. Revision History at https://github.com/ryanfrancesconi/spfk-base

import Foundation

extension NSException {
    public var error: NSError {
        var userInfo: [String: Any] = userInfo as? [String: Any] ?? .init()

        userInfo[NSLocalizedDescriptionKey] = reason
        userInfo["callStackSymbols"] = callStackSymbols.joined(separator: "\n")

        return NSError(
            domain: name.rawValue,
            code: 1,
            userInfo: userInfo,
        )
    }
}
