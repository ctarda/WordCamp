/**
 Supporting model object, necessary for the WordCamp parser
 - SeeAlso: WordCamp
 */
struct WordCampContent: Decodable, Equatable {
    let rendered: String
}
