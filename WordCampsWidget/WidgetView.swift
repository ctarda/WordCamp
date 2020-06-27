//
//  WidgetView.swift
//  WordCampsWidgetExtension
//
//  Created by Cesar Tardaguila on 27/6/2020.
//  Copyright © 2020 automattic. All rights reserved.
//

import SwiftUI

struct WidgetView: View {
    let wordCamp: WordCamp

    var body: some View {
        Text(wordCamp.title.rendered)
    }
}

struct WidgetView_Previews: PreviewProvider {
    static var previews: some View {
        let wordCamp = WordCamp(id: 1,
                                title: WordCampTitle(rendered: "WC Cesar"),
                                content: WordCampContent(rendered: "Content"),
                                featuredMedia: 0,
                                location: "Ottawa",
                                startDate: Date(),
                                endDate: nil,
                                url: "http://wordcamp.com",
                                venueName: "A venue name",
                                venueAddress: "A venue address",
                                venueCoordinates: VenueCoordinates(latitude: 0, longitude: 0),
                                twitter: "@wordpress")
        return WidgetView(wordCamp: wordCamp)
    }
}
