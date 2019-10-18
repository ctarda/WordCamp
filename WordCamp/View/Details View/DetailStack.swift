import SwiftUI

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


struct DetailStack_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EventViewModel(event: PreviewData.wordCamp())
        return DetailStack(event: viewModel)
    }
}
