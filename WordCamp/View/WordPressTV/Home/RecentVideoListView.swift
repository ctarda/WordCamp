import SwiftUI

struct RecentVideoListView: View {
    let video: VideoViewModel

    var body: some View {
        HStack {
            Text(video.title)
        }
    }
}
