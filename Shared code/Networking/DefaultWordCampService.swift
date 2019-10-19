import Foundation
import Combine

final class DefaultWordCampService: WordCampService {
    private let session: URLSession
    private let decoder: JSONDecoder

    init(session: URLSession = .shared, decoder: JSONDecoder = .init()) {
        self.session = session
        self.decoder = decoder
    }
}

extension DefaultWordCampService {
    func getAll() -> AnyPublisher<[WordCamp], Error> {
        guard let url = URL(string: "https://central.wordcamp.org/wp-json/wp/v2/wordcamps?status=wcpt-scheduled&per_page=100") else {
            preconditionFailure("Can't create URL for endpoint")
        }

        return session.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [WordCamp].self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
