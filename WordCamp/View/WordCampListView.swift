import SwiftUI

struct WordCampListView: View {
    let event: EventViewModel

    var body: some View {
        HStack(spacing: 12) {
            CircleImage(url: event.thumbnail)
                .frame(width: 40, height: 40, alignment: .center)
                .shadow(radius: 4)
            VStack(alignment: .leading) {
                Text(event.readableTitle).font(.headline)
                Text(event.location).font(.subheadline)
                Text(event.startDate)
            }
        }
    }
}
