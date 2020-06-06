//
//  TableView.swift
//  Events
//
//  Created by Matteo Manferdini on 12/06/2020.
//  Copyright © 2020 Matteo Manferdini. All rights reserved.
//

import SwiftUI

protocol TableItem {
	static var navigationTitle: String { get }
	static var actionName: String { get }
	static var buttonColor: Color { get }

	var headline: String { get }
	var imageName: String { get }
	var subheadline1: String { get }
	var subheadline2: String { get }
}

struct TableView<Item: TableItem & Identifiable>: View {
	let items: [Item]
	
	var body: some View {
		NavigationView {
			List(items) { item in
				Row(item: item)
			}
			.navigationBarTitle(Item.navigationTitle)
		}
	}
}

struct Row<Item: TableItem>: View {
	let item: Item
	
	var body: some View {
		HStack(spacing: 16.0) {
			Image(item.imageName)
				.resizable()
				.frame(width: 70.0, height: 70.0)
				.cornerRadius(10.0)
			VStack(alignment: .leading, spacing: 4.0) {
				Text(item.headline)
					.font(.headline)
				Group {
					Text(item.subheadline1)
					Text("\(item.subheadline2) people going")
				}
				.font(.subheadline)
				.foregroundColor(.secondary)
			}
			Spacer()
			RowButton(title: Item.actionName, color: Item.buttonColor)
		}
		.padding(.vertical, 16.0)
	}
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			TableView(items: TestData.events)
			TableView(items: TestData.participants)
		}
    }
}
