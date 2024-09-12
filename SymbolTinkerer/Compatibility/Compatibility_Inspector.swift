import Foundation
import SwiftUI

extension CompatibilityProxy {

    func inspector<V: View>(isPresented: Binding<Bool>, @ViewBuilder content: @escaping () -> V) -> some View {
        #if os(tvOS) || os(visionOS)
        self.content.sheet(isPresented: isPresented, content: content)
        #else
        self.content.inspector(isPresented: isPresented, content: content)
        #endif
    }

}
