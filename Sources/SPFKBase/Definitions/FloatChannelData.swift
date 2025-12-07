// Copyright Ryan Francesconi. All Rights Reserved. Revision History at https://github.com/ryanfrancesconi/spfk-base

import Foundation

/// 2D array of multiple float arrays
public typealias FloatChannelData = [[Float]]

/// Initialize a new FloatChannelData. Convenience function.
public func allocateFloatChannelData(length: Int, channelCount: Int) -> FloatChannelData {
    FloatChannelData(repeating: [Float](zeros: length), count: channelCount)
}
