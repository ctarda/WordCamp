import SwiftUI

struct WordCampDetail: View {
    let event: EventViewModel

    var body: some View {
        VStack {
            MapView(coordinate: event.locationCoordinates)
                .frame(height: CGFloat(200))

            CircleImage(url: event.thumbnail)
                .frame(width: 100, height: 100, alignment: .center)
                .offset(y: -50)
                .padding(.bottom, -50)
                .shadow(radius: 10)

            DetailStack(event: event)
        }
        .navigationBarTitle(Text(event.readableTitle), displayMode: .inline)
    }
}

struct DetailStack: View {
    let event: EventViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(event.readableTitle).font(.title)
                .lineLimit(2)
            HStack {
                Text(event.location).font(.headline)
                Spacer()
                Text(event.startDate).font(.headline)
            }
            Text(event.venueName).font(.headline)
            Text(event.venueAddress).font(.headline)
            Text(event.readableContent)
                .font(.body)
                .lineLimit(Int.max)

            Spacer()

            OpenLinkButton(event: event)
        }
        .padding()
    }
}

struct OpenLinkButton: View {
    @State private var showModal: Bool = false

    let event: EventViewModel

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

struct WordCampDetail_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EventViewModel(event: PreviewData.wordCamp())
        return WordCampDetail(event: viewModel)
    }
}
