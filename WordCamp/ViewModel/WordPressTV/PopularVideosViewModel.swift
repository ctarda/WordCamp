import Foundation
import Combine

final class PopularVideosViewModel: ObservableObject {
    private let service: WordPressTVService
    private var cancellabe: AnyCancellable?

    var objectWillChange = PassthroughSubject<PopularVideosViewModel, Never>()

    private var videoList = VideoList(videos: []) {
          didSet {
              DispatchQueue.main.async {
                  self.objectWillChange.send(self)
              }
          }
      }

    var videos: [VideoViewModel] {
        return videoList.videos.map { VideoViewModel(video: $0) }
    }


    init(service: WordPressTVService = WordPressTVService()) {
        self.service = service
        fetchVideos()
    }

    private func fetchVideos() {
        cancellabe = service
            .getWordCampTVVideos()
            .catch { _ in Just([]) }
            .map { $0.sorted() }
            .map { VideoList(videos: $0) }
            .receive(on: RunLoop.main)
            .assign(to: \.videoList, on: self)
    }
}

