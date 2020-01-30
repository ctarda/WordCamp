import Foundation

/**
 Wraps a collection of events. Generic on an implementation
 of the EventViewModel protocol
 */
struct WordCampList<ItemViewModel: EventViewModel> {
    private let events: [WordCamp]
    /**
     Returns a collection of view models corresponding to the
     wrapped events
     */
    lazy var eventViewModels: [ItemViewModel] = {
        return events.map { ItemViewModel(event: $0) }
    }()

    init(events: [WordCamp]) {
        self.events = events
    }
}
