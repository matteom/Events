//
//  Model.swift
//  Events
//
//  Created by Matteo Manferdini on 06/06/2020.
//  Copyright © 2020 Matteo Manferdini. All rights reserved.
//

import Foundation
import SwiftUI

struct Event: Decodable, Identifiable {
	let title: String
	let date: Date
	let participants: Int
	
	var id: String { title }
}

extension Event: TableItem {
	static var navigationTitle: String { "Events" }
	static var actionName: String { "Join" }
	static var buttonColor: Color { .orange }
	
	var headline: String { title }
	var imageName: String { title }
	var subheadline1: String { date.formatted(.full) }
	var subheadline2: String { "\(participants) people going" }
}

struct Person: Decodable, Identifiable {
	let name: String
	let friends: Int
	let joined: Date
	
	var id: String { name }
}

extension Person: TableItem {
	static var navigationTitle: String { "Participants" }
	static var actionName: String { "Message" }
	static var buttonColor: Color { .blue }

	var headline: String { name }
	var imageName: String { name }
	var subheadline1: String { "\(friends) friends" }
	var subheadline2: String { "Joined \(joined.formatted(.long))" }
}
