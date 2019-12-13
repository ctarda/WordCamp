import SwiftUI

struct WordCampDetail: View {
    let event: PhoneEventViewModel
    @State private var showShareSheet = false

    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    MapView(coordinate: event.annotation.coordinate,
                            delta: 2.0,
                            annotations: [event.annotation])
                        .frame(height: CGFloat(200))

                    CircleImage(url: event.thumbnail)
                        .frame(width: 100, height: 100, alignment: .center)
                        .offset(y: -50)
                        .padding(.bottom, -50)
                        .shadow(radius: 10)

                    // This VSTack used to be encapsulated in its own View, but
                    // when embeded in a ScrollView, it crashes. 
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

                        TwitterButton(event: event)
                    }
                    .padding()
                }
            }
            OpenLinkButton(event: event)
        }
        .navigationBarTitle(Text(event.readableTitle), displayMode: .inline)
        .navigationBarItems(trailing: ShareLinkButton(event: event))
    }
}



struct WordCampDetail_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = PhoneEventViewModel(event: PreviewData.wordCamp())
        return Group {
            WordCampDetail(event: viewModel)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
                .previewDisplayName("iPhone 11 Pro Max")

            WordCampDetail(event: viewModel)
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch)"))
                .previewDisplayName("iPad Pro (11-inch)")
        }
    }
}
