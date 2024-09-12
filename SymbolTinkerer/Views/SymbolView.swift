import Foundation
import SwiftUI

struct SymbolView: View {

    let configuration: SymbolConfiguration

    var image: Image {
        switch configuration.source {
        case .apple:
            Image(systemName: configuration.name)
        case .custom:
            Image(configuration.name)
        }
    }

    var body: some View {
        image
    }

}
