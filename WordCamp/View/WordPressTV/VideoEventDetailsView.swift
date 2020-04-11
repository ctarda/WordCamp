import SwiftUI

struct VideoEventDetailsView: View {
    let event: VideoEventViewModel

    var body: some View {
        VStack {
            Text(event.name)
            //Text(event.badgeCount)
        }
    }
}
