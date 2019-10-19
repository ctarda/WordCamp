import SwiftUI

struct WatchWordCampListView: View {
    let event: WatchEventViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text(event.readableTitle).font(.headline)
                .fixedSize(horizontal: false, vertical: true)
            Text(event.location).font(.subheadline)
                .fixedSize(horizontal: false, vertical: true)
            Text(event.startDate)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}
