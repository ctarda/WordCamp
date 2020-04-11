import Foundation

struct CategoryViewModel: Identifiable {
    let category: Category
}

extension CategoryViewModel {
    var id: String {
        return category.id.description
    }

    var name: String {
        return category.name
    }

    var badgeCount: String {
        return category.videos.description
    }
}
