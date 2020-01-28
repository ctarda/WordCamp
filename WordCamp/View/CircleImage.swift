import SwiftUI

/**
 View rendering a RemoteImageview masked in a circle with border
 - SeeAlso: RemoteImageView
 */
struct CircleImage: View {
    let url: String

    var body: some View {
           RemoteImageView(imageURL: url)
               .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4))
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(url: "").frame(width: 100, height: 100)
    }
}
