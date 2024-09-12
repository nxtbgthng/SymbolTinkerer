import Foundation
import SwiftUI

struct SymbolInspector: View {

    @Binding var configuration: SymbolConfiguration

    var body: some View {
        HStack {
            Picker("Source", selection: $configuration.source) {
                ForEach(SymbolConfiguration.Source.allCases, id: \.self) { source in
                    source.image.tag(source)
                }
            }
            .pickerStyle(.segmented)
            .labelsHidden()
            TextField("Name", text: $configuration.name)
                .layoutPriority(2)
        }
    }
}

#Preview {
    @Previewable @State var configuration = SymbolConfiguration()
    SymbolInspector(configuration: $configuration)
}
