import Foundation

extension NotificationCenter {
    /// Useful for sending a notification and waiting for the result
    /// - Parameter notificationName: name to wait for
    /// - Returns: the `Notification`
    public static func wait(for notificationName: Notification.Name) async throws -> Notification {
        let asyncSequence = NotificationCenter.default.notifications(named: notificationName)
        let iterator = asyncSequence.makeAsyncIterator()

        guard let notification = await iterator.next() else {
            throw NSError(description: "Failed to get \(notificationName)")
        }

        return notification
    }
}
