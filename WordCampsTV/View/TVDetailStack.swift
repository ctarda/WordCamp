import SwiftUI

struct TVDetailStack: View {
    let event: PhoneEventViewModel

    var body: some View {
        VStack {
            Text(event.readableTitle).font(.title)
                .lineLimit(2)
            HStack {
                Text(event.location).font(.headline)
                Spacer()
                Text(event.date).font(.headline)
            }
            Text(event.venueName).font(.headline)
            Text(event.venueAddress).font(.headline)
        }
        .padding()
    }
}


struct DetailStack_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = PhoneEventViewModel(event: PreviewData.wordCamp())
        return TVDetailStack(event: viewModel)
    }
}
