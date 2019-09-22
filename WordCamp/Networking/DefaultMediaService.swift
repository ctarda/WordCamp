import Foundation
import Combine

final class DefaultMediaService {
    private let session: URLSession
    private let decoder: JSONDecoder

    init(session: URLSession = .shared, decoder: JSONDecoder = .init()) {
        self.session = session
        self.decoder = decoder
    }
}

extension DefaultMediaService: MediaService {
    func getAll(id: Int) -> AnyPublisher<Media, Error> {
        guard let url = URL(string: "https://central.wordcamp.org/wp-json/wp/v2/media/\(id)") else {
            preconditionFailure("Can't create URL for endpoint")
        }

        return session.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: Media.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
