import Foundation
import Combine
import SwiftUI

final class ApplicationViewModel: ObservableObject {
    private let service: WordPressTVService

    private let allEventsViewModel: AllVideoEventsViewModel

    @ObservedObject var allVideosViewModel: AllVideosViewModel
    @ObservedObject var popularVideosViewModel: PopularVideosViewModel

    private lazy var homeMenuSection: HomeMenuSection =  {
        HomeMenuSection(service: self.service)
    }()

    var menuSection: some View {
        homeMenuSection.section()
    }

    var newVideosSection: some View {
        NewVideosSection(allVideosViewModel: allVideosViewModel)
    }

    var popularVideosSection: some View {
        PopularVideosSection(popularVideosViewModel: popularVideosViewModel)
    }

    init(service: WordPressTVService = WordPressTVService()) {
        self.service = service
        self.allEventsViewModel = AllVideoEventsViewModel(service: service)
        self.allVideosViewModel = AllVideosViewModel(service: service)
        self.popularVideosViewModel = PopularVideosViewModel(service: service)
    }
}
