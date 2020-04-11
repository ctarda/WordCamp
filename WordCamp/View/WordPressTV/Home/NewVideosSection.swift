import SwiftUI

struct NewVideosSection: View {
    @ObservedObject var allVideosViewModel: AllVideosViewModel

    var body: some View {
        Section(header: Text("Latest Videos")) {
            ForEach(self.allVideosViewModel.videos) { video in
                HStack {
                    RemoteImageView(imageURL: video.thumbnail)
                        .frame(width: 100, height: 60, alignment: .center)
                    Text(video.title)
                }
            }
        }
    }
}
