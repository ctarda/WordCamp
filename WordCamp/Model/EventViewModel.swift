import Foundation

protocol EventViewModel {
    init(event: WordCamp)
    func matches(textFilter: String) -> Bool
}
