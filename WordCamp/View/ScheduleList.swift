import SwiftUI

struct ScheduleList: View {
    @ObservedObject var viewModel: WordCampsViewModel<PhoneEventViewModel>

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $viewModel.textFilter)
                LoadingView(isShowing: self.viewModel.isLoading) {
                    List(self.viewModel.events) { event in
                        NavigationLink(destination: WordCampDetail(event: event)) {
                            WordCampListView(event: event)
                        }
                    }
                    .navigationBarTitle(Text("Upcoming WordCamps"))
                }
            }
        }
    }

    init(viewModel: WordCampsViewModel<PhoneEventViewModel>) {
        self.viewModel = viewModel
    }
}

struct ScheduleList_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleList(viewModel: WordCampsViewModel<PhoneEventViewModel>())
    }
}
