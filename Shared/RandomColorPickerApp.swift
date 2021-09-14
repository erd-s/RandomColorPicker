//
//  RandomColorPickerApp.swift
//  Shared
//
//  Created by Christopher Erdos on 9/13/21.
//

import SwiftUI

@main
struct RandomColorPickerApp: App {
    var body: some Scene {
        WindowGroup {
			ZStack {
				Color(UIColor(hex: "#787f95"))
				ContentView()
			}.edgesIgnoringSafeArea(.all)
        }
    }
}
