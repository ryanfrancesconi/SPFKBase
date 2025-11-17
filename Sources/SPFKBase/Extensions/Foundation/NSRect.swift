// Copyright Ryan Francesconi. All Rights Reserved. Revision History at https://github.com/ryanfrancesconi/SPFKUtils

import CoreGraphics
import Foundation

extension NSRect {
    public init(size: NSSize) {
        self = NSRect(origin: CGPoint(x: 0, y: 0), size: size)
    }

    public init(width: CGFloat, height: CGFloat) {
        self = NSRect(x: 0, y: 0, width: width, height: height)
    }

    public init(width: Int, height: Int) {
        self = NSRect(x: 0, y: 0, width: width, height: height)
    }
    
//    public init(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
//        self = NSRect(origin: CGPoint(x: x, y: y), size: CGSize(width: width, height: height))
//    }
}
