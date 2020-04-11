import SwiftUI

struct AllCategoriesListView: View {
    @ObservedObject var viewModel: AllCategoriesViewModel

    var body: some View {
        NavigationView {
            List(self.viewModel.categories) { category in
                CategoryListView(category: category)
            }
            .navigationBarTitle(Text("All Categories"))
        }
    }
}

struct AllCategoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        AllCategoriesListView(viewModel: AllCategoriesViewModel() )
    }
}


