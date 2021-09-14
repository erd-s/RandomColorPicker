//
//  ContentView.swift
//  Shared
//
//  Created by Christopher Erdos on 9/13/21.
//

import SwiftUI
import UIKit

struct ContentView: View {
	@State var color: Color = Color.primary
	@State var colorText: String = Color.primary.hex()
	@State var textColor: Color = Color.primary
	@State var randomColors: [RandomColor] = RandomColor.make(60)
	
	
    var body: some View {
		VStack(spacing: 40) {
			Button(action: {
				self.randomColors = RandomColor.make(60)
			}, label: {
				Image(systemName: "arrow.clockwise.circle.fill")
					.resizable()
					.foregroundColor(.random())
					
			}).frame(width: 20, height: 20)
			
			LazyHGrid(rows: self.gridRows()) {
				ForEach(self.randomColors, id: \RandomColor.id) { rand in
					Rectangle()
						.cornerRadius(8)
						.frame(width: 40, height: 40)
						.foregroundColor(rand.color)
						.onTapGesture {
							self.colorText = rand.color.hex()
							self.color = rand.color
						}
				}
			}.animation(.easeInOut)
			Divider()
			HStack {
				Rectangle()
					.cornerRadius(8)
					.frame(width: 40, height: 40)
					.foregroundColor(self.color)
					.animation(.default)
				Text(self.colorText)
					.foregroundColor(self.textColor)
			}.onTapGesture {
				UIPasteboard.general.string = self.colorText
				self.textColor = self.color
				
				DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
					self.textColor = .primary
				}
			}
		}
	}
	
	func gridRows() -> [GridItem] {
		return Array(repeating: GridItem(.fixed(5), spacing: 40, alignment: .center), count: 10)
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
