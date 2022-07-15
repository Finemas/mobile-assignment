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

    func stringFormat(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
