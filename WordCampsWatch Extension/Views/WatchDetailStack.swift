import SwiftUI

struct WatchDetailStack: View {
    let event: WatchEventViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 2) {
                Text(event.readableTitle).font(.headline)
                    .fixedSize(horizontal: false, vertical: true)
                Text(event.location).font(.body)
                    .fixedSize(horizontal: false, vertical: true)
                Text(event.startDate).font(.body)
                    .fixedSize(horizontal: false, vertical: true)
                Text(event.venueName).font(.body)
                    .fixedSize(horizontal: false, vertical: true)
                Text(event.venueAddress).font(.body)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
                HStack {
                    Spacer()
                    WatchMapView(coordinate: event.locationCoordinates,
                                 delta: 0.02)
                        .frame(width: 120, height: 120, alignment: .center)
                    Spacer()
                }
            }
        }
    }
}

struct WatchDetailStack_Preview: PreviewProvider {
    static var previews: some View {
        let viewModel = WatchEventViewModel(event: PreviewData.wordCamp())
        return WatchDetailStack(event: viewModel)
    }
}
