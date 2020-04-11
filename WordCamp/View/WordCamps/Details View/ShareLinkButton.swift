import SwiftUI

struct ShareLinkButton: View {
    @State private var showShareSheet = false

    let event: PhoneEventViewModel

    var body: some View {
        Button(action: {
            self.showShareSheet = true
        }) {
            Image(systemName: "square.and.arrow.up")
        }.sheet(isPresented: $showShareSheet) {
            ShareSheet(activityItems: [URL(string:self.event.url) as Any])
        }
    }
}
