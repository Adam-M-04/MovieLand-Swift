//
//  DateFormatter.swift
//  MovieLand
//
//  Created by Adam Mąka on 28/08/2022.
//

import Foundation

func FormatDate(unformatted: String) -> String {
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyy-MM-dd"
    
    let dateFormatterReturn = DateFormatter()
    dateFormatterReturn.locale = Locale(identifier: "en_US")
    dateFormatterReturn.dateFormat = "MMM d, yyyy"
    
    if let date = dateFormatterGet.date(from: unformatted) {
        return dateFormatterReturn.string(from: date)
    } else {
       return unformatted
    }
}
