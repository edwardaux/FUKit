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
	var contentView: FUView
	
	init(frame: NSRect) {
		self.frame = frame
		self.contentView = FUView(frame: frame)
		super.init()
		self.contentView.nextResponder = self
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
		self.contentView.displayIfNeeded()
	}
}
