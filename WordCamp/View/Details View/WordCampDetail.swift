import SwiftUI

struct WordCampDetail: View {
    let event: EventViewModel

    var body: some View {
        VStack {
            MapView(coordinate: event.locationCoordinates)
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
        let viewModel = EventViewModel(event: PreviewData.wordCamp())
        return WordCampDetail(event: viewModel)
    }
}
