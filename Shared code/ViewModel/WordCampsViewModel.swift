import Foundation
import Combine

final class WordCampsViewModel<ItemViewModel: EventViewModel>: ObservableObject {
    private let service: WordCampService
    private var cancellabe: AnyCancellable?

    var textFilter: String = "" {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send(self)
            }
        }
    }

    var objectWillChange = PassthroughSubject<WordCampsViewModel<ItemViewModel>, Never>()

    private var wordCampList = WordCampList<ItemViewModel>(events: []) {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send(self)
            }
        }
    }

    var events: [ItemViewModel] {
        if textFilter == "" {
            return wordCampList.eventViewModels
        }

        return wordCampList.eventViewModels.filter {
            return $0.matches(textFilter: textFilter)
        }
    }

    init(service: WordCampService = DefaultWordCampService()) {
        self.service = service
        fetchWordCamps()
    }

    private func fetchWordCamps() {
        cancellabe = service
            .getAll()
            .catch { _ in Just([]) }
            .map { $0.sorted() }
            .map { WordCampList(events: $0) }
            .assign(to: \.wordCampList, on: self)
    }
}
