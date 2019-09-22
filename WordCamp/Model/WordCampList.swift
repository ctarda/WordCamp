import Foundation

struct WordCampList {
    private let events: [WordCamp]
    
    lazy var eventViewModels: [EventViewModel] = {
        return events.map { EventViewModel(event: $0) }
    }()

    init(events: [WordCamp]) {
        self.events = events
    }
}
