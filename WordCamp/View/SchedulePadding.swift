import SwiftUI

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
