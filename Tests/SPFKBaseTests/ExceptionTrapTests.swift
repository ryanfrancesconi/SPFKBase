import AVFoundation
import Foundation
import SPFKBase
import Testing

class ExceptionTrapTests: TestCaseModel {
    struct Object {
        func throwError() throws {
            throw NSError(description: #function)
        }
    }

    @Test func swiftErrorWithSelf() async throws {
        try await wait(sec: 4)
        
        var object: Object? = Object()

        #expect(throws: Error.self) {
            try ExceptionTrap.withThrowing {
                try object?.throwError()
            }
        }
        
        object = nil

        try await wait(sec: 4)
    }

    @Test func nsError() async throws {
        #expect(throws: Error.self) {
            // 'required condition is false: _engine != nil'
            try ExceptionTrap.withThrowing { AVAudioPlayerNode().play() }
        }
    }
}
