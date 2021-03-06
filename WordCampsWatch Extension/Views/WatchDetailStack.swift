import SwiftUI

struct WatchDetailStack: View {
    let event: WatchEventViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 2) {
                Text(event.readableTitle).font(.headline)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
                Text(event.location).font(.body)
                    .fixedSize(horizontal: false, vertical: true)
                Divider()
                Text(event.date).font(.body)
                    .fixedSize(horizontal: false, vertical: true)
                Divider()
                Text(event.venueName).font(.body)
                    .fixedSize(horizontal: false, vertical: true)
                Text(event.venueAddress).font(.body)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
                HStack {
                    Spacer()
                    WatchMapView(coordinate: event.annotation.coordinate,
                                 delta: 0.02, annotations: [event.annotation])
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
