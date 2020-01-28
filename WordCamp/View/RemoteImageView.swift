import Foundation
import SwiftUI

/**
    A View that renders the contents of a RemoteImage as UIImage, presenting a placeholder while the RemoteImage is being downloaded.

    An image named as `event-placeholder` will be used as placeholder

    - SeeAlso: RemoteImage
 */
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
