import Foundation

struct WordCampList<ItemViewModel: EventViewModel> {
    private let events: [WordCamp]
    
    lazy var eventViewModels: [ItemViewModel] = {
        return events.map { ItemViewModel(event: $0) }
    }()

    init(events: [WordCamp]) {
        self.events = events
    }
}
