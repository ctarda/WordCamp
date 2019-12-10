import SwiftUI

struct DetailStack: View {
    let event: PhoneEventViewModel

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text(event.readableTitle).font(.title)
                        .lineLimit(2)

                    Divider()

                    HStack {
                        Text(event.location).font(.headline)
                        Spacer()
                        Text(event.date).font(.headline)
                            .foregroundColor(.secondary)
                    }

                    Divider()

                    Text(event.venueName).font(.headline)
                    Text(event.venueAddress).font(.headline)

                    Divider()

                    Text(event.readableContent)
                        .font(.body)
                        .lineLimit(Int.max)

                    Spacer()
                }
            }
            OpenLinkButton(event: event)
        }
        .padding()
    }
}


struct DetailStack_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = PhoneEventViewModel(event: PreviewData.wordCamp())
        return DetailStack(event: viewModel)
    }
}
