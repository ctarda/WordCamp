import Foundation
import Combine

final class WordPressTVService {
    private let session: URLSession
    private let decoder: JSONDecoder

    init(session: URLSession = .shared, decoder: JSONDecoder = .init()) {
        self.session = session
        self.decoder = decoder
        self.decoder.dateDecodingStrategy = .formatted(Date.iso8601WithoutTimeZone)
    }
}

extension WordPressTVService {
    func getAllEvents() -> AnyPublisher<[VideoEvent], Error> {
        guard let url = URL(string: "https://wordpress.tv/api/events.json") else {
            preconditionFailure("Can't create URL for endpoint")
        }

        return session.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: EventEnvelope.self, decoder: decoder)
            .map { $0.events }
            .eraseToAnyPublisher()
    }

    func getAllVideos() -> AnyPublisher<[Video], Error> {
        guard let url = URL(string: "https://wordpress.tv/api/videos.json") else {
            preconditionFailure("Can't create URL for endpoint")
        }

        return session.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: VideoEnvelope.self, decoder: decoder)
            .map { $0.videos }
            .eraseToAnyPublisher()
    }

    func getWordCampTVVideos() -> AnyPublisher<[Video], Error> {
        guard let url = URL(string: "https://public-api.wordpress.com/rest/v1.1/sites/wordpress.tv/posts?orderby=relevance&order=desc") else {
            preconditionFailure("Can't create URL for endpoint")
        }

        return session.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: VideoEnvelope.self, decoder: decoder)
            .map { $0.videos }
            .eraseToAnyPublisher()
    }

    func getAllCategories() -> AnyPublisher<[Category], Error> {
        guard let url = URL(string: "https://wordpress.tv/api/categories.json") else {
            preconditionFailure("Can't create URL for endpoint")
        }

        return session.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: CategoryEnvelope.self, decoder: decoder)
            .map { $0.categories }
            .eraseToAnyPublisher()
    }
}
