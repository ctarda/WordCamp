import Foundation

struct Video: Decodable, Identifiable {
    let id: String
    let title: String
    let description: String
    let date: Date
    let thumbnail: String

    init(id: String,
         title: String,
         description: String,
         date: Date,
         thumbnail: String) {
        self.id = id
        self.title = title
        self.description = description
        self.date = date
        self.thumbnail = thumbnail
    }
}


// MARK:- Decodable
extension Video {
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case date
        case thumbnail
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let id = try container.decode(String.self, forKey: .title)
        let title = try container.decode(String.self, forKey: .title)
        let description = try container.decode(String.self, forKey: .description)

        let date = try container.decodeIfPresent(Date.self, forKey: .date) ?? Date()

        let thumbnail = try container.decode(String.self, forKey: .thumbnail)

        self.init(id: id,
                  title: title,
                  description: description,
                  date: date,
                  thumbnail: thumbnail)
    }
}


// MARK:- Comparable
extension Video: Comparable {
    static func < (lhs: Video, rhs: Video) -> Bool {
        return lhs.date < rhs.date
    }

    static func == (lhs: Video, rhs: Video) -> Bool {
        return lhs.date == rhs.date
    }
}

struct VideoEnvelope: Decodable {
    let videos: [Video]

    private enum CodingKeys: String, CodingKey {
        case videos
    }
}
