//
//  NoItemsView.swift
//  TodoList
//
//  Created by Scotty Schwartz-Owen on 6/28/24.
//

import SwiftUI

struct NoItemsView: View {

	@State var animate: Bool = false

	let secondaryAccentColor = Color("SecondaryAccentColor")

    var body: some View {
			ScrollView {
				VStack(spacing: 10) {
					Text("There are no items.")
						.font(.title)
						.fontWeight(.semibold)
					Text("To get started, add some items to your list.")
						.foregroundColor(.gray)
						.padding(.bottom, 20)
					NavigationLink(destination: AddView(), label: {
						Text("Add Something 🥳")
							.foregroundStyle(.white)
							.font(.headline)
							.frame(height: 55)
							.frame(maxWidth: .infinity)
							.background(animate ? secondaryAccentColor : Color.accentColor)
							.clipShape(.buttonBorder)
					})
					.padding(.horizontal, animate ? 30 : 50)
					.shadow(
						color: animate ? secondaryAccentColor.opacity(0.5) : Color.accentColor.opacity(0.5) ,
						radius: animate ? 30 : 10,
						x: 0,
						y: animate ? 50 : 30)
					.scaleEffect(animate ? 1.1 : 1.0)
					.offset(y: animate ? -7 : 0)
				}
				.frame(maxWidth: 400)
				.multilineTextAlignment(.center)
				.padding(40)
				.onAppear(perform: addAnimation)
			}
			.frame(maxWidth: .infinity, maxHeight: .infinity)
    }

	func addAnimation() {
		guard !animate else { return }
		DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
			withAnimation(
				Animation
					.easeInOut(duration: 2.0)
					.repeatForever()
			) {
				animate.toggle()
			}
		}
	}
}

#Preview {
	NavigationStack {
		NoItemsView()
			.navigationTitle("Title")
	}
}
