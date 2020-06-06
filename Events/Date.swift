//
//  Date.swift
//  Events
//
//  Created by Matteo Manferdini on 06/06/2020.
//  Copyright © 2020 Matteo Manferdini. All rights reserved.
//

import Foundation

extension Date {
	func formatted(_ style: DateFormatter.Style) -> String {
		let formatter = DateFormatter()
		formatter.dateStyle = style
		return formatter.string(from: self)
	}
}
