import SwiftUI

struct WatchDetailStack: View {
    let event: WatchEventViewModel

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

        }
        .padding()
    }
}
