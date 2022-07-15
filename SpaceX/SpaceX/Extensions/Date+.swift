//
//  Date+.swift
//  SpaceX
//
//  Created by Jan Provaznik on 15.07.2022.
//

import Foundation

extension Date {

    init(_ dateString: String, stringFormat: String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = stringFormat
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval: 0, since: date)
    }

    // Convert date to locale date format
    func stringFormat(format: String) -> String {
        let dateFormat = DateFormatter.dateFormat(fromTemplate: format, options: 0, locale: Locale.current)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.locale = .current
        return dateFormatter.string(from: self)
    }
}
