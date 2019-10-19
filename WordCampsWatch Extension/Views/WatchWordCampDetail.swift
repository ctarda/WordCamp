import SwiftUI

struct WatchWordCampDetail: View {
    let event: WatchEventViewModel

    var body: some View {
        VStack {
            WatchDetailStack(event: event)
        }
    }
}
