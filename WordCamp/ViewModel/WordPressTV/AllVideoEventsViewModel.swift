import Foundation
import Combine

final class AllVideoEventsViewModel: ObservableObject {
    private let service: WordPressTVService
    private var cancellabe: AnyCancellable?
    
    var objectWillChange = PassthroughSubject<AllVideoEventsViewModel, Never>()
    
    private var eventList = VideoEventList(events: []) {
          didSet {
              DispatchQueue.main.async {
                  self.objectWillChange.send(self)
              }
          }
      }
    
    var events: [VideoEventViewModel] {
        return eventList.events.map { VideoEventViewModel(event: $0) }
    }

    
    init(service: WordPressTVService = WordPressTVService()) {
        self.service = service
        fetchEvents()
    }
    
    private func fetchEvents() {
        cancellabe = service
            .getAllEvents()
            .catch { _ in Just([]) }
            .map { $0.sorted() }
            .map { VideoEventList(events: $0) }
            .receive(on: RunLoop.main)
            .assign(to: \.eventList, on: self)
    }
}
