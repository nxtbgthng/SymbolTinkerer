import SwiftUI

struct MainView: View {

    @State private var presentsInspector = false

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .toolbar {
            Toggle("Inspector", systemImage: "sidebar.trailing", isOn: $presentsInspector)
        }
        compatibility.inspector(isPresented: $presentsInspector) {
            Text("Inspector")
        }
    }
}

#Preview {
    NavigationStack {
        MainView()
    }
}
