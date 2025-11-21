// Copyright Ryan Francesconi. All Rights Reserved. Revision History at https://github.com/ryanfrancesconi/SPFKAudioHardware
// Based on SimplyCoreAudio by Ruben Nine (c) 2014-2024. Revision History at https://github.com/rnine/SimplyCoreAudio

import Foundation

extension Bool {
    public init<T: BinaryInteger>(_ integer: T) {
        self.init(integer != 0)
    }
}
