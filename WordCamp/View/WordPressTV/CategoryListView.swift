import SwiftUI

struct CategoryListView: View {
    let category: CategoryViewModel

    var body: some View {
        HStack {
            Text(category.name)
            Text(category.badgeCount)
        }
    }
}
