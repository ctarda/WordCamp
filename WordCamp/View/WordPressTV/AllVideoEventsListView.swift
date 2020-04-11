import SwiftUI

struct AllVideoEventsView: View {
    @ObservedObject var viewModel: AllVideoEventsViewModel
    
    var body: some View {
        NavigationView {
            List(self.viewModel.events) { event in
                NavigationLink(destination: VideoEventDetailsView(event: event)) {
                    VideoEventListView(event: event)
                }
            }
            .navigationBarTitle(Text("All Events"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AllVideoEventsView(viewModel: AllVideoEventsViewModel() )
    }
}
