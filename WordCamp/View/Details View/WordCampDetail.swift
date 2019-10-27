import SwiftUI

struct WordCampDetail: View {
    let event: PhoneEventViewModel

    var body: some View {
        VStack {
            MapView(coordinate: event.locationCoordinates,
                    delta: 2.0)
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
