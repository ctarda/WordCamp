import SwiftUI

struct TVWordCampDetail: View {
    let event: PhoneEventViewModel

    var body: some View {
        VStack {
            MapView(coordinate: event.locationCoordinates, delta: 2.0)
                .frame(height: CGFloat(500.0))

            CircleImage(url: event.thumbnail)
                .frame(width: CGFloat(260.0), height: CGFloat(260.0), alignment: .center)
                .offset(y: CGFloat(-130))
                .padding(.bottom, CGFloat(-130.0))
                .shadow(radius: 10)

            Spacer()

            TVDetailStack(event: event)
            .padding()
        }
    }
}



struct TVWordCampDetail_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = PhoneEventViewModel(event: PreviewData.wordCamp())
        return TVWordCampDetail(event: viewModel)
    }
}
