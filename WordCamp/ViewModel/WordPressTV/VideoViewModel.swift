import Foundation

struct VideoViewModel: Identifiable {
    let video: Video
}

extension VideoViewModel {
    var id: String {
        return video.id.description
    }

    var title: String {
        return video.title
    }

    var thumbnail: String {
        return video.thumbnail
    }
    
    var description: String {
        return video.description
    }
    
    var videoURL: URL {
        return URL(string: video.videoItems.videoItems.mediumURL)!
    }
}
