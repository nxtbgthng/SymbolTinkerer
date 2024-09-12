import Foundation
import SwiftUI

struct SymbolView: View {

    let configuration: SymbolConfiguration
    @Environment(\.symbolVariants) private var symbolVariants

    var image: Image {
        switch configuration.source {
        case .apple:
            Image(systemName: configuration.name)
        case .custom:
            Image(configuration.name)
        }
    }

    var body: some View {
        VStack(spacing: 20) {
            image
                .font(.system(size: 200))
            Text("Inline Image \(image) looks like this")
            Button(action: {}) {
                Label(
                    title: { Text("Tap Me") },
                    icon: { image })
            }
        }
        .contentTransition(.symbolEffect(.replace.magic(fallback: .downUp)))
    }

}

#Preview {
    let configuration = SymbolConfiguration(name: "ant.circle")
    SymbolView(configuration: configuration)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
}
