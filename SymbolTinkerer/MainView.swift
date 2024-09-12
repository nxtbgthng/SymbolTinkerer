import SwiftUI

struct MainView: View {

    @State private var presentsInspector = false
    @State private var configuration = SymbolConfiguration()

    var body: some View {
        VStack {
            SymbolView(configuration: configuration)
        }
        .padding()
        .toolbar {
            Toggle("Inspector", systemImage: "sidebar.trailing", isOn: $presentsInspector)
        }
        .compatibility.inspector(isPresented: $presentsInspector) {
            SymbolInspector(configuration: $configuration)
        }
    }
}

#Preview {
    NavigationStack {
        MainView()
    }
}
