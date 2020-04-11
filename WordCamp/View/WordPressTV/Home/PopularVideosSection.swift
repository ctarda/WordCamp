import SwiftUI

struct PopularVideosSection: View {
    @ObservedObject var popularVideosViewModel: PopularVideosViewModel

    var body: some View {
        Section(header: Text("Popular Videos")) {
            ForEach(self.popularVideosViewModel.videos) { video in
                Text(video.title)
            }
        }
    }
}
