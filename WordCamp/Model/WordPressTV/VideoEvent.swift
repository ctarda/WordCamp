import Foundation

struct VideoEvent: Decodable, Identifiable {
    let id: Int
    let name: String
    let link: String
    let api: String
    let videos: Int
    
    init(id: Int,
         name: String,
         link: String,
         api: String,
         videos: Int) {
        self.id = id
        self.name = name
        self.link = link
        self.api = api
        self.videos = videos
    }
}


// MARK:- Decodable
extension VideoEvent {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case link
        case api
        case videos
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let id = try container.decode(Int.self, forKey: .id)
        let name = try container.decode(String.self, forKey: .name)
        let link = try container.decode(String.self, forKey: .link)
        let api = try container.decode(String.self, forKey: .api)
        let videos = try container.decode(Int.self, forKey: .videos)
        
        self.init(id: id,
                  name: name,
                  link: link,
                  api: api,
                  videos: videos)
    }
}


// MARK:- Comparable
extension VideoEvent: Comparable {
    static func < (lhs: VideoEvent, rhs: VideoEvent) -> Bool {
        return lhs.id < rhs.id
    }

    static func == (lhs: VideoEvent, rhs: VideoEvent) -> Bool {
        return lhs.id == rhs.id
    }
}

struct EventEnvelope: Decodable {
    let events: [VideoEvent]

    private enum CodingKeys: String, CodingKey {
        case events = "events"
    }
}
