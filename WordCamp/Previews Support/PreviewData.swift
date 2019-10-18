import Foundation

struct PreviewData {
    static func wordCamp() -> WordCamp {
        WordCamp(id: 0,
                 title: wordCampTitle(),
                 content: wordCampContent(),
                 featuredMedia: 0,
                 location: "Rosebud",
                 startDate: Date(),
                 url: "http://somewhere.on.the.internet.com",
                 venueName: "Resebud bowl",
                 venueAddress: "12 Hung Lok Rd",
                 venueCoordinates: venueCoordinates())
    }

    static func wordCampTitle() -> WordCampTitle {
        WordCampTitle(rendered: "WordCamp Rosebud")
    }

    static func wordCampContent() -> WordCampContent {
        WordCampContent(rendered: "The extended description of a WordCamp")
    }

    static func venueCoordinates() -> VenueCoordinates {
        VenueCoordinates(latitude: 40.4169, longitude: 3.7035)
    }
}
