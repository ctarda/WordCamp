import SwiftUI

struct TwitterButton: View {
    let event: PhoneEventViewModel

    var body: some View {
        HStack(alignment: .center) {
            Spacer()

            Button(action: {
                guard let url = URL(string: "https://twitter.com/@\(self.event.twitterHandle)") else {
                    return
                }
                UIApplication.shared.open(url)
            }) {
                Image("twitter")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .accentColor(.secondary)
                Text(event.twitterHandle)
            }

            Spacer()
        }
    }
}
