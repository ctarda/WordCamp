import Combine

/**
 Abstracts the service that obtains data from the WordCamp API
 */
protocol WordCampService {
    /**
     Gets all scheduled WordCamps
     
     - Returns: A Publisher wrapping an array of WordCamp objects
     */
    func getAll() -> AnyPublisher<[WordCamp], Error>
}
