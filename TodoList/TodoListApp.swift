//
//  TodoListApp.swift
//  TodoList
//
//  Created by Scotty Schwartz-Owen on 4/29/24.
//

import SwiftUI

/*
 MVVM Architecture

 Model - data point
 View - UI
 ViewModel - manages models for view

 */

@main
struct TodoListApp: App {

	@StateObject var listViewModel: ListViewModel = ListViewModel()

    var body: some Scene {
        WindowGroup {
					NavigationStack {
						ListView()
					}
					.toolbarRole(.navigationStack)
					.environmentObject(listViewModel)
        }
    }
}
