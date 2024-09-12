import Foundation
import SwiftUI

public enum Compatibility {}

public struct CompatibilityProxy<Content: View> {
    let content: Content
}

public extension View {
    var compatibility: CompatibilityProxy<Self> {
        CompatibilityProxy(content: self)
    }
}
