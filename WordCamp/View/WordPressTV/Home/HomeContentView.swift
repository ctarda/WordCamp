import SwiftUI

struct HomeContentView: View {
    @ObservedObject var viewModel: ApplicationViewModel

    var body: some View {
        NavigationView {
            List {
                viewModel.menuSection
                viewModel.newVideosSection
            }
            .navigationBarTitle(Text("Videos"))
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
        .modifier(MenuPadding())
    }
}
