import Foundation
import SwiftUI

struct SymbolInspector: View {

    @Binding var configuration: SymbolConfiguration

    var body: some View {
        Form {
            HStack {
                TextField("Name", text: $configuration.name)
                    .layoutPriority(2)
                Picker("Source", selection: $configuration.source) {
                    ForEach(SymbolConfiguration.Source.allCases, id: \.self) { source in
                        source.image.tag(source)
                    }
                }
                .pickerStyle(.segmented)
                .labelsHidden()
            }
        }
        .navigationTitle("Symbol Inspector")
    }
}

#Preview {
    @Previewable @State var configuration = SymbolConfiguration()
    SymbolInspector(configuration: $configuration)
        .formStyle(.grouped)
}
