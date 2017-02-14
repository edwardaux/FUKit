//
//  FUWindow.swift
//  FUKit
//
//  Created by Craig Edwards on 14/02/2017.
//  Copyright © 2017 BlackDog Foundry Pty Ltd. All rights reserved.
//

import Foundation

class FUWindow : FUResponder {
	var frame: NSRect
	var firstResponder: FUResponder?
	
	init(frame: NSRect) {
		self.frame = frame
		super.init()
		self.firstResponder = self
	}
	
	func send(event: FUEvent) {
		switch event.type {
		case .motion:
			let _ = self.firstResponder?.tryToPerform(event: event)
		case .touch:
			let _ = self.firstResponder?.tryToPerform(event: event)
		}
	}
	
	func update() {
		fuGraphicsDrawRect(self.frame, 0.0, 1.0, 0.0, 1.0)
	}
}
