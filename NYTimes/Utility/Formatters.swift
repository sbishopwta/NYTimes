//
//  Formatters.swift
//  NYTimes
//
//  Created by Steven Bishop on 1/17/17.
//  Copyright © 2017 Steven Bishop. All rights reserved.
//

import Foundation

struct Formatters {
    //TODO: Move objective c and swift formatters to one place
    static let dayMonthYearFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()

    static let iso8601Formatter = ISO8601DateFormatter()
}
