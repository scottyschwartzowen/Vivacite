//
//  AddView.swift
//  TodoList
//
//  Created by Scotty Schwartz-Owen on 4/29/24.
//

import SwiftUI

struct AddView: View {

	@EnvironmentObject var listViewModel: ListViewModel
	@Environment(\.presentationMode) var presentationMode

	@State var textFieldText: String = ""
	@State var alertTitle: String = ""
	@State var showAlert: Bool = false

	var body: some View {
			ScrollView {
				VStack {
					TextField("Type something here...", text: $textFieldText)
						.padding(.horizontal)
						.frame(height: 55)
						.background(Color(UIColor.secondarySystemBackground))
						.cornerRadius(15)

					Button(action: savedButtonPressed, label: {
						Text("Save".uppercased())
							.foregroundStyle(Color.white)
							.font(.headline)
							.frame(height: 55)
							.frame(maxWidth: .infinity)
							.background(Color.accentColor)
							.cornerRadius(15)
					})

				}
				.padding(14)
			}
			.navigationTitle("Add an Item 🖊️")
			.alert(isPresented: $showAlert, content: getAlert)
    }

	func savedButtonPressed() {
		if textIsAppropriate() {
			listViewModel.addItem(title: textFieldText)
			presentationMode.wrappedValue.dismiss()
		}
	}

	func textIsAppropriate() -> Bool {
		if textFieldText.count < 3 {
			alertTitle = "Your new Todo item must be at least 3 characters long! 😯"
			showAlert.toggle()
			return false
		}
		return true
	}

	func getAlert() -> Alert {
		return Alert(title: Text(alertTitle))
	}
}

#Preview {
	NavigationView {
		AddView()
	}
	.environmentObject(ListViewModel())
}
