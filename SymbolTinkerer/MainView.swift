import SwiftUI

struct MainView: View {

    @State private var presentsInspector = false
    @State private var configuration = SymbolConfiguration(name: "ant")



    var body: some View {
        VStack {
            SymbolView(configuration: configuration)
                .frame(maxHeight: .infinity)
        }
        .padding()
        .displayOptionsInspector()
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
