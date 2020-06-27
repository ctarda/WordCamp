//
//  WordCampsWidget.swift
//  WordCampsWidget
//
//  Created by Cesar Tardaguila on 27/6/2020.
//  Copyright © 2020 automattic. All rights reserved.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    public func snapshot(for configuration: ConfigurationIntent, with context: Context, completion: @escaping (SimpleEntry) -> ()) {
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
        let entry = SimpleEntry(date: Date(), configuration: configuration, wordCamp: wordCamp)
        completion(entry)
    }

    public func timeline(for configuration: ConfigurationIntent, with context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
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
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration, wordCamp: wordCamp)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    public let date: Date
    public let configuration: ConfigurationIntent
    let wordCamp: WordCamp
}

struct PlaceholderView : View {
    var body: some View {
        Text("Placeholder View")
    }
}

struct WordCampsWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        WidgetView(wordCamp: entry.wordCamp)
    }
}

@main
struct WordCampsWidget: Widget {
    private let kind: String = "WordCampsWidget"

    public var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider(), placeholder: PlaceholderView()) { entry in
            WordCampsWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("WordCamp")
        .description("Keep track of the upcoming Wordcamps.")
    }
}

struct WordCampsWidget_Previews: PreviewProvider {
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
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
