import SwiftUI

/// Custom view modifier that applies the default padding
/// on iPadOS, so that the Schedule can be presented
/// as a split view
struct SchedulePadding: ViewModifier {
    func body(content: Content) -> some View {
        Group {
            if isIPad() {
                content.padding()
            } else {
                content
            }
        }
    }
}

private extension SchedulePadding {
    func isIPad() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
}
