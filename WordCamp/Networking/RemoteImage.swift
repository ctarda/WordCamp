import Foundation
import Combine

final class RemoteImage: ObservableObject {
    var objectWillChange = PassthroughSubject<RemoteImage, Never>()

    var data = Data() {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send(self)
            }
        }
    }

    init(url: String) {
        guard let url = URL(string: url) else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                return
            }

            self.data = data
        }.resume()
    }
}
