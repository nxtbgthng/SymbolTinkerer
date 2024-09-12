import Foundation
import SwiftUI

extension View {

    /// Shows an Inspector to change several font and image metrics
    public func displayOptionsInspector() -> some View {
        modifier(DisplayOptionsInspectorViewModifier())
    }
}

struct DisplayOptionsInspectorViewModifier: ViewModifier {

    @State private var slash = false
    @State private var fill = false
    @State private var circle = false
    @State private var square = false
    @State private var rectangle = false
    @State private var weight: Font.Weight = .regular
    @State private var imageScale: Image.Scale = .small

    func body(content: Content) -> some View {
        ScrollView {
            content
                .frame(maxWidth: .infinity)
        }
        .scrollBounceBehavior(.basedOnSize)
            .symbolVariant(slash ? .slash : .none)
            .symbolVariant(fill ? .fill : .none)
            .symbolVariant(circle ? .circle : .none)
            .symbolVariant(square ? .square : .none)
            .symbolVariant(rectangle ? .rectangle : .none)
            .fontWeight(weight)
            .imageScale(imageScale)
            .safeAreaInset(edge: .bottom) {
                inspector
            }
    }

    private var inspector: some View {
        VStack {
            ControlGroup {
                Toggle("Slash", systemImage: "circle.slash.fill", isOn: $slash)
                Toggle("Fill", systemImage: "app.fill", isOn: $fill)
                Toggle("Circle", systemImage: "circle", isOn: $circle)
                Toggle("Square", systemImage: "square", isOn: $square)
                Toggle("Rectangle", systemImage: "rectangle", isOn: $rectangle)
            }
            .toggleStyle(.button)
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
        .pickerStyle(.segmented)
        .frame(maxWidth: 600)
        .padding()
        .frame(maxWidth: .infinity)
        .overlay(alignment: .top) {
            Divider()
                .ignoresSafeArea()
        }
        .background(.regularMaterial)
    }

}

#Preview {
    Label("Lamp", systemImage: "lightbulb")
        .font(.largeTitle)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .displayOptionsInspector()
}
