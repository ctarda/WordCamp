import Foundation

struct VideoEventViewModel: Identifiable {
    let event: VideoEvent
}

extension VideoEventViewModel {
    var id: String {
        return event.id.description
    }

    var name: String {
        return event.name
    }

    var badgeCount: String {
        return event.videos.description
    }
}
