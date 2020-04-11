import SwiftUI

struct OpenLinkButton: View {
    @State private var showModal: Bool = false

    let event: PhoneEventViewModel

    var body: some View {
        HStack(alignment: .center) {
            Spacer()

            Button(action: {
                self.showModal = true
            }) {
                Text("Open website")
            }
            .sheet(isPresented: self.$showModal) {
                SafariView(url: URL(string: self.event.url)!)
            }

            Spacer()
        }
    }
}


struct OpenLinkButton_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = PhoneEventViewModel(event: PreviewData.wordCamp())
        return OpenLinkButton(event: viewModel)
    }
}

