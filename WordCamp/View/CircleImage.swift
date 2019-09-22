import SwiftUI

struct CircleImage: View {
    let url: String

    var body: some View {
           RemoteImageView(imageURL: url)
               .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4))
    }
}
