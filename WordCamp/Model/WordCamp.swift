import Foundation

struct WordCamp: Decodable, Identifiable {
    let id: Int
    let title: WordCampTitle
    let content: WordCampContent
    let featuredMedia: Int
    let location: String
    let startDate: Date
    let url: String
    let venueName: String
    let venueAddress: String
    let venueCoordinates: VenueCoordinates

    init(id: Int,
         title: WordCampTitle,
         content: WordCampContent,
         featuredMedia: Int,
         location: String,
         startDate: Date,
         url: String,
         venueName: String,
         venueAddress: String,
         venueCoordinates: VenueCoordinates) {
        self.id = id
        self.title = title
        self.content = content
        self.featuredMedia = featuredMedia
        self.location = location
        self.startDate = startDate
        self.url = url
        self.venueName = venueName
        self.venueAddress = venueAddress
        self.venueCoordinates = venueCoordinates
    }
}

// MARK:- Decodable
extension WordCamp {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case content = "content"
        case featuredMedia = "featured_media"
        case location = "Location"
        case startDate = "Start Date (YYYY-mm-dd)"
        case url = "URL"
        case venueName = "Venue Name"
        case venueAddress = "Physical Address"
        case venueCoordinates = "_venue_coordinates"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let id = try container.decode(Int.self, forKey: .id)
        let title = try container.decode(WordCampTitle.self, forKey: .title)
        let content = try container.decode(WordCampContent.self, forKey: .content)
        let featuredMedia = try container.decode(Int.self, forKey: .featuredMedia)
        let location = try container.decode(String.self, forKey: .location)
        let startDateString = try container.decodeIfPresent(String.self, forKey: .startDate) ?? ""
        let startDateDouble = Double(startDateString) ?? 0
        let date = Date(timeIntervalSince1970: startDateDouble)

        let url = try container.decode(String.self, forKey: .url)

        let venueName = try container.decode(String.self, forKey: .venueName)
        let venueAddress = try container.decode(String.self, forKey: .venueAddress)
        let venueCoordinates = try container.decode(VenueCoordinates.self, forKey: .venueCoordinates)

        self.init(id: id,
                  title: title,
                  content: content,
                  featuredMedia: featuredMedia,
                  location: location,
                  startDate: date,
                  url: url,
                  venueName: venueName,
                  venueAddress: venueAddress,
                  venueCoordinates: venueCoordinates)
    }

}

// MARK:- Comparable
extension WordCamp: Comparable {
    static func < (lhs: WordCamp, rhs: WordCamp) -> Bool {
        return lhs.startDate < rhs.startDate
    }

    static func == (lhs: WordCamp, rhs: WordCamp) -> Bool {
        return lhs.id == rhs.id
    }
}
