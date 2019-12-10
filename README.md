# WordCamp iOS

A sample app built using SwiftUI.

## Screenshots

WordCamp list iOS

<img src="/docs/images/wordcamp-list-iphone.png" alt="WordCamp list iPhone" width="250"/>

WordCamp details iOS

<img src="/docs/images/wordcamp-details-iphone.png" alt="WordCamp details iPhone" width="250"/>

WorCamp List and details iPadOS 

<img src="/docs/images/wordcamp-ipad.png" alt="WordCamp details iPhone" width="500"/>

## Architecture

This app is built using a traditional three layer architecture. 

<img src="/docs/images/architecture-overview.png" alt="Architecture overview" width="500"/>

### Data transfer 

Data is provided by an implementation of the `WordCampService` protocol, that uses the endpoint `https://central.wordcamp.org/wp-json/wp/v2/wordcamps` to fetch the list of upcoming WordCamps.

### Business logic

Data obtained from the data transfer layer is prepared for presentation in `WordCampsViewModel`. Each WordCamp is prepared for presentation by an `EventViewModel`

### UI

The list of WordCamps is rendered by `ScheduleList`, with each individual "cell" rendered by `WordCampListView` and the individual WordCamp details view is rendered by `WordCampDetail`



