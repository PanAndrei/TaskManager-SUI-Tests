//
//  String+Extension.swift
//  homework-1
//
//  Created by Andrei Panasenko on 31.05.2022.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
