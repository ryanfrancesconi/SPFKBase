// Copyright Ryan Francesconi. All Rights Reserved. Revision History at https://github.com/ryanfrancesconi/SPFKUtils

import Foundation

extension NSError {
    public convenience init(
        domain: String = Log.defaultSubsystem,
        code: Int = 1,
        description: String
    ) {
        let userInfo: [String: Any] = [
            NSLocalizedDescriptionKey: description,
        ]

        self.init(
            domain: domain,
            code: code,
            userInfo: userInfo
        )
    }
}
