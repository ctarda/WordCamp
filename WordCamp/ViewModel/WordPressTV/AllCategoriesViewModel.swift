import Foundation
import Combine

final class AllCategoriesViewModel: ObservableObject {
    private let service: WordPressTVService
    private var cancellabe: AnyCancellable?

    var objectWillChange = PassthroughSubject<AllCategoriesViewModel, Never>()

    private var categoryList = CategoryList(categories: []) {
          didSet {
              DispatchQueue.main.async {
                  self.objectWillChange.send(self)
              }
          }
      }

    var categories: [CategoryViewModel] {
        return categoryList.categories.map { CategoryViewModel(category: $0) }
    }


    init(service: WordPressTVService = WordPressTVService()) {
        self.service = service
        fetchCategories()
    }

    private func fetchCategories() {
        cancellabe = service
            .getAllCategories()
            .catch { _ in Just([]) }
            .map { $0.sorted() }
            .map { CategoryList(categories: $0) }
            .receive(on: RunLoop.main)
            .assign(to: \.categoryList, on: self)
    }
}
