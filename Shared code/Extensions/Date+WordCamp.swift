import Foundation

extension Date {
    func toString(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        formatter.locale = Locale.current

        return formatter.string(from: self)
    }

    func toStringMonthAndDay() -> String {
        return toString(template: "ddMMMM")
    }

    func toStringDay() -> String {
        return toString(template: "dd")
    }

    func toStringYear() -> String {
        return toString(template: "YYYY")
    }
}

extension Date {
    static let iso8601WithoutTimeZone: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
}

private extension Date {
    func toString(template: String) -> String {
        let format = DateFormatter.dateFormat(fromTemplate: template, options: 0, locale: Locale.current)
        let formatter = DateFormatter()
        formatter.dateFormat = format

        return formatter.string(from: self)
    }
}
