import SwiftUI

struct WatchWordCampDetail: View {
    let event: WatchEventViewModel

    var body: some View {
        VStack {
            WatchDetailStack(event: event)
        }
    }
}


struct WatchWordCampDetail_Preview: PreviewProvider {
    static var previews: some View {
        let viewModel = WatchEventViewModel(event: PreviewData.wordCamp())
        return WatchWordCampDetail(event: viewModel)
    }
}
