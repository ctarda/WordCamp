struct Media {
    let thumbnail: String
}

extension Media: Decodable {
    enum CodingKeys: String, CodingKey {
        case mediaDetails = "media_details"
        case sizes = "sizes"
        case thumbnail = "thumbnail"
        case source = "source_url"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let mediaDetails = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .mediaDetails)
        let sizes = try mediaDetails.nestedContainer(keyedBy: CodingKeys.self, forKey: .sizes)
        let thumbnail = try sizes.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnail)
        let source = try thumbnail.decode(String.self, forKey: .source)

        self.init(thumbnail: source)
    }
}
