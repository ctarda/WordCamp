import Foundation
import Combine

final class WatchWordCampsViewModel: ObservableObject {
    private let service: WordCampService
    private var cancellabe: AnyCancellable?

    var textFilter: String = "" {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send(self)
            }
        }
    }

    var objectWillChange = PassthroughSubject<WatchWordCampsViewModel, Never>()

    private var wordCampList = WatchWordCampList(events: []) {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send(self)
            }
        }
    }

    var events: [WatchEventViewModel] {
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
            .map { WatchWordCampList(events: $0) }
            .assign(to: \.wordCampList, on: self)
    }
}
