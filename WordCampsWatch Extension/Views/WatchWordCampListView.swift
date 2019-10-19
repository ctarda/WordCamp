import SwiftUI

struct WatchWordCampListView: View {
    let event: WatchEventViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text(event.readableTitle).font(.headline)
            Text(event.location).font(.subheadline)
            Text(event.startDate)
        }
    }
}
