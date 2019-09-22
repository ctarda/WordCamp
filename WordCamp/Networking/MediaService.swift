import Combine

protocol MediaService {
    func getAll(id: Int) -> AnyPublisher<Media, Error>
}
