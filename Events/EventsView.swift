//
//  ContentView.swift
//  Events
//
//  Created by Matteo Manferdini on 06/06/2020.
//  Copyright © 2020 Matteo Manferdini. All rights reserved.
//

import SwiftUI

struct EventsView: View {
	let events: [Event]
	
    var body: some View {
		NavigationView {
			List(events) { event in
				EventRow(event: event)
			}
			.navigationBarTitle("Events")
		}
    }
}

struct EventRow: View {
	let event: Event
	
	var body: some View {
		HStack(spacing: 16.0) {
			Image(event.title)
				.resizable()
				.frame(width: 70.0, height: 70.0)
				.cornerRadius(10.0)
			VStack(alignment: .leading, spacing: 4.0) {
				Text(event.title)
					.font(.headline)
				Group {
					Text(event.date.formatted(.full))
					Text("\(event.participants) people going")
				}
				.font(.subheadline)
				.foregroundColor(.secondary)
			}
			Spacer()
			RowButton(title: "Join", color: .orange)
		}
		.padding(.vertical, 16.0)
	}
}

struct RowButton: View {
	let title: String
	let color: Color
	
	var body: some View {
		Text(title)
			.font(.subheadline)
			.bold()
			.foregroundColor(.white)
			.padding(EdgeInsets(top: 8.0, leading: 16.0, bottom: 8.0, trailing: 16.0))
			.background(color)
			.cornerRadius(20)
	}
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			EventsView(events: TestData.events)
			VStack(spacing: 8.0) {
				RowButton(title: "Join", color: .orange)
				RowButton(title: "Message", color: .blue)
			}
			.padding()
			.previewLayout(.sizeThatFits)
		}
    }
}
