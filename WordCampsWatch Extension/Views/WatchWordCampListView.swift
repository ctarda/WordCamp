import SwiftUI

struct WatchWordCampListView: View {
    let event: WatchEventViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text(event.readableTitle).font(.headline)
                .fixedSize(horizontal: false, vertical: true)
            Text(event.location).font(.subheadline)
                .foregroundColor(Color.gray)
                .fixedSize(horizontal: false, vertical: true)
            Text(event.startDate)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

struct WatchWordCampListView_Preview: PreviewProvider {
    static var previews: some View {
        let viewModel = WatchEventViewModel(event: PreviewData.wordCamp())
        return WatchWordCampListView(event: viewModel)
    }
}
