import Foundation
import SwiftUI

struct SymbolConfiguration {

    enum Source: CaseIterable {
        case apple, custom
        var image: Image {
            switch self {
            case .apple: Image(systemName: "apple.logo")
            case .custom: Image(systemName: "hammer")
            }
        }
    }

    var name: String = ""
    var source: Source = .apple

}
