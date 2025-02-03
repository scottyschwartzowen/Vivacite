//
//  ListRowView.swift
//  TodoList
//
//  Created by Scotty Schwartz-Owen on 4/29/24.
//

import SwiftUI

struct ListRowView: View {

	let item: ItemModel

	var body: some View {
		HStack {
			Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
				.foregroundStyle(item.isCompleted ? Color.green : Color.red)
			Text(item.title)
			Spacer()
		}
		.font(.title2)
		.padding(.vertical, 8)
	}
}

#Preview("This is the first title") {
	Group {
		ListRowView(item: ItemModel(title: "First item", isCompleted: false))
		ListRowView(item: ItemModel(title: "This is the second item", isCompleted: true))
	}
	.previewLayout(.sizeThatFits)
}

