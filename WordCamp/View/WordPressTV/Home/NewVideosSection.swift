import SwiftUI

struct NewVideosSection: View {
    @ObservedObject var allVideosViewModel: AllVideosViewModel

    var body: some View {
        Section(header: Text("Latest Videos")) {
            ForEach(self.allVideosViewModel.videos) { video in
                NavigationLink(destination: NewVideoDetailsView(video: video)) {
                    NewVideoListView(video: video)
                }
            }
        }
    }
}
