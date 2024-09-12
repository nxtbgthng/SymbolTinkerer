import SwiftUI

struct MainView: View {

    @State private var presentsInspector = false
    @State private var configuration = SymbolConfiguration(name: "ant")

    @State private var slash = false
    @State private var fill = false
    @State private var circle = false
    @State private var square = false
    @State private var rectangle = false
    @State private var weight: Font.Weight = .regular
    @State private var imageScale: Image.Scale = .small

    var body: some View {
        VStack {
            SymbolView(configuration: configuration)
                .symbolVariant(slash ? .slash : .none)
                .symbolVariant(fill ? .fill : .none)
                .symbolVariant(circle ? .circle : .none)
                .symbolVariant(square ? .square : .none)
                .symbolVariant(rectangle ? .rectangle : .none)
                .fontWeight(weight)
                .imageScale(imageScale)
                .frame(maxHeight: .infinity)
            Divider()
            //ControlGroup {
                Toggle("Slash", systemImage: "circle.slash.fill", isOn: $slash)
                Toggle("Fill", systemImage: "app.fill", isOn: $fill)
                Toggle("Circle", systemImage: "circle", isOn: $circle)
                Toggle("Square", systemImage: "square", isOn: $square)
                Toggle("Rectangle", systemImage: "rectangle", isOn: $rectangle)
            //}
            Picker("Weight", selection: $weight) {
                Text("UltraLight").tag(Font.Weight.ultraLight).fontWeight(.ultraLight)
                Text("Thin").tag(Font.Weight.thin).fontWeight(.thin)
                Text("Light").tag(Font.Weight.light).fontWeight(.light)
                Text("Regular").tag(Font.Weight.regular).fontWeight(.regular)
                Text("Medium").tag(Font.Weight.medium).fontWeight(.medium)
                Text("Semibold").tag(Font.Weight.semibold).fontWeight(.semibold)
                Text("Bold").tag(Font.Weight.bold).fontWeight(.bold)
                Text("Heavy").tag(Font.Weight.heavy).fontWeight(.heavy)
                Text("Black").tag(Font.Weight.black).fontWeight(.black)
            }
            Picker("Scale", selection: $imageScale) {
                Text("Small").tag(Image.Scale.small)
                Text("Medium").tag(Image.Scale.medium)
                Text("Large").tag(Image.Scale.large)
            }
        }
        .pickerStyle(.automatic)
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
