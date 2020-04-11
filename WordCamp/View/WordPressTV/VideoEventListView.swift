import SwiftUI

struct VideoEventListView: View {
    let event: VideoEventViewModel
    
    var body: some View {
        HStack {
            Text(event.name)
            Text(event.badgeCount)
        }
    }
}
