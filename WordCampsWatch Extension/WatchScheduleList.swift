import SwiftUI

struct WatchScheduleList: View {
    @ObservedObject var viewModel: WordCampsViewModel<WatchEventViewModel>
    var body: some View {
        WatchLoadingView(isShowing: self.viewModel.isLoading) {
            List(self.viewModel.events) { event in
                NavigationLink(destination: WatchWordCampDetail(event: event)) {
                    WatchWordCampListView(event: event)
                }
            }
        }
    }

    init(viewModel: WordCampsViewModel<WatchEventViewModel>) {
        self.viewModel = viewModel
    }
}
