//
//  TestData.swift
//  Events
//
//  Created by Matteo Manferdini on 06/06/2020.
//  Copyright © 2020 Matteo Manferdini. All rights reserved.
//

import Foundation

struct TestData {
	static let events: [Event] = readFile(named: "Events")
	static let participants: [Person] = readFile(named: "Participants")
	
	static func readFile<ModelType: Decodable>(named name: String) -> [ModelType]  {
		let url = Bundle.main.url(forResource: name, withExtension: "json")!
		let data = try! Data(contentsOf: url)
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .secondsSince1970
		return try! decoder.decode([ModelType].self, from: data)
	}
}
