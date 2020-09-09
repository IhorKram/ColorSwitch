//
//  DateExtension.swift
//  Loyalty
//
//  Created by Ihor Kramarets on 27.07.2020.
//  Copyright © 2020 Ihor Kramarets. All rights reserved.
//

import Foundation


extension Date {
    static func dateFromCustomString(customString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        return dateFormatter.date(from: customString) ?? Date()
    }
}
