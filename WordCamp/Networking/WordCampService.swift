import Combine

protocol WordCampService {
    func getAll() -> AnyPublisher<[WordCamp], Error>
}
