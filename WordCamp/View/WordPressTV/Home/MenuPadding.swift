import SwiftUI

/// Custom view modifier that applies the default padding
/// on iPadOS, so that the Schedule can be presented
/// as a split view
struct MenuPadding: ViewModifier {
    func body(content: Content) -> some View {
        Group {
            if shouldApplyPadding() {
                content.padding(.all, 0.5)
            } else {
                content
            }
        }
    }
}

private extension MenuPadding {
    func shouldApplyPadding() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
}
