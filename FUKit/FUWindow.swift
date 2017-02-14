//
//  FUWindow.swift
//  FUKit
//
//  Created by Craig Edwards on 14/02/2017.
//  Copyright © 2017 BlackDog Foundry Pty Ltd. All rights reserved.
//

import Foundation

class FUWindow {
	func send(event: FUEvent) {
		switch event.type {
		case .motion:
			print(event)
		case .touch:
			print(event)
		}
	}
	
	func update() {
		let rect = NSRect(x: 100, y: 100, width: 50, height: 50)
		fuGraphicsDrawRect(rect, 0.0, 1.0, 0.0, 1.0)
	}
}
