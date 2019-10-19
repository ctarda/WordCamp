import SwiftUI

struct TVWordCampDetail: View {
    let event: PhoneEventViewModel

    var body: some View {
        VStack {
            MapView(coordinate: event.locationCoordinates)
                .frame(height: CGFloat(400.0))

            CircleImage(url: event.thumbnail)
                .frame(width: CGFloat(100.0), height: CGFloat(100.0), alignment: .center)
                .offset(y: CGFloat(-50))
                .padding(.bottom, CGFloat(-50.0))
                .shadow(radius: 10)

            TVDetailStack(event: event)
        }
    }
}



struct TVWordCampDetail_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = PhoneEventViewModel(event: PreviewData.wordCamp())
        return TVWordCampDetail(event: viewModel)
    }
}
