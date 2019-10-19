import SwiftUI

struct WatchScheduleList: View {
    @ObservedObject var viewModel: WatchWordCampsViewModel
    var body: some View {
        List(viewModel.events) { event in
            NavigationLink(destination: WatchWordCampDetail(event: event)) {
                WatchWordCampListView(event: event)
            }
        }
    }

    init(viewModel: WatchWordCampsViewModel) {
        self.viewModel = viewModel
    }
}
