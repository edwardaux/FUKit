//
//  FUResponder.swift
//  FUKit
//
//  Created by Craig Edwards on 14/02/2017.
//  Copyright © 2017 BlackDog Foundry Pty Ltd. All rights reserved.
//

import Foundation

class FUResponder {
	var nextResponder: FUResponder?
	
	public func tryToPerform(event: FUEvent) -> Bool {
		let handled: Bool
		switch event.type {
		case .motion:
			handled = self.motionBegan()
		case .touch:
			handled = self.touchesBegan(touches: event.touches)
		}
		
		if !handled {
			if let next = self.nextResponder {
				return next.tryToPerform(event: event)
			}
		}
		return handled
	}
	
	public func motionBegan() -> Bool {
		return false
	}
	
	public func touchesBegan(touches: [FUTouch]) -> Bool {
		return false
	}
}
