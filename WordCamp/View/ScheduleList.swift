import SwiftUI

struct ScheduleList: View {
    @ObservedObject var viewModel: WordCampsViewModel

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $viewModel.textFilter)
            List(viewModel.events) { event in
                NavigationLink(destination: WordCampDetail(event: event)) {
                    WordCampListView(event: event)
                }
            }
            .navigationBarTitle(Text("Upcoming WordCamps"))
            }
        }
    }

    init(viewModel: WordCampsViewModel) {
        self.viewModel = viewModel
    }
}

struct ScheduleList_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleList(viewModel: WordCampsViewModel())
    }
}
