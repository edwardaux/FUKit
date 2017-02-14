//
//  FUEvent.swift
//  FUKit
//
//  Created by Craig Edwards on 14/02/2017.
//  Copyright © 2017 BlackDog Foundry Pty Ltd. All rights reserved.
//

import Foundation

struct FUTouch {
	let location: NSPoint
}

struct FUEvent {
	enum FUType {
		case motion
		case touch(x: Int, y: Int)
	}
	
	let type: FUType
	let window: FUWindow
	
	var touches: [FUTouch] {
		switch self.type {
		case .motion: return []
		case .touch(let x, let y): return [FUTouch(location: NSPoint(x: x, y: y))]
		}
	}
}
