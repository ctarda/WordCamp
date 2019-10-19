import Foundation

struct WordCampList {
    private let events: [WordCamp]
    
    lazy var eventViewModels: [PhoneEventViewModel] = {
        return events.map { PhoneEventViewModel(event: $0) }
    }()

    init(events: [WordCamp]) {
        self.events = events
    }
}
