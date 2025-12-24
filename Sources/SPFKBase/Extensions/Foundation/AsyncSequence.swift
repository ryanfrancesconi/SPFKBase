// Copyright Ryan Francesconi. All Rights Reserved. Revision History at https://github.com/ryanfrancesconi/spfk-base

import AsyncAlgorithms
import Foundation

extension AsyncSequence {
    public func toArray() async rethrows -> [Element] {
        try await reduce(into: []) { $0.append($1) }
    }
}
