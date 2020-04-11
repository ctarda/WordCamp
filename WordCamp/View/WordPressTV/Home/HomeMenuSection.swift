import SwiftUI

struct HomeMenuSection {
    let service: WordPressTVService

    func section() -> some View {
        Section() {
             topicsRow()
             downloadedRow()
         }
    }

    private func topicsRow() -> some View {
        NavigationLink(destination: AllCategoriesListView(viewModel: AllCategoriesViewModel(service: self.service))) {
            Text("Topics")
        }
    }

    private func downloadedRow() -> some View {
        Text("Downloaded")
    }
}
