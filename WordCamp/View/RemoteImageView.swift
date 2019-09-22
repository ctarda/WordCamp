import Foundation
import SwiftUI

struct RemoteImageView: View {
    @ObservedObject var remoteImage: RemoteImage

    init(imageURL: String) {
        remoteImage = RemoteImage(url: imageURL)
    }

    var body: some View {
        Image(uiImage: UIImage(data: remoteImage.data) ?? UIImage(imageLiteralResourceName: "event-placeholder"))
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
}
