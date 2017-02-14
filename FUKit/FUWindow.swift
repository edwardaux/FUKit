//
//  FUWindow.swift
//  FUKit
//
//  Created by Craig Edwards on 14/02/2017.
//  Copyright © 2017 BlackDog Foundry Pty Ltd. All rights reserved.
//

import Foundation

class FUWindow {
	var frame: NSRect
	
	init(frame: NSRect) {
		self.frame = frame
	}
	
	func send(event: FUEvent) {
		switch event.type {
		case .motion:
			print(event)
		case .touch:
			print(event)
		}
	}
	
	func update() {
		fuGraphicsDrawRect(self.frame, 0.0, 1.0, 0.0, 1.0)
	}
}
