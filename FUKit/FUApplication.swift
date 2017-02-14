//
//  FUApplication.swift
//  FUKit
//
//  Created by Craig Edwards on 14/02/2017.
//  Copyright © 2017 BlackDog Foundry Pty Ltd. All rights reserved.
//

import Foundation

class FUApplication  {
	static let shared = FUApplication()
	
	private var windows = [FUWindow]()
	private var eventQueue = [FUEvent]()
	
	init() {
		fuGraphicsSetup()
		fuGraphicsSetTouchBeganFunction { (x, y) in
			if let window = FUApplication.shared.windowForPoint(x: x, y: y) {
				FUApplication.shared.post(event: FUEvent(type: .touch(x: Int(x), y: Int(y)), window: window))
			}
		}
		fuGraphicsSetDisplayFunction { 
			FUApplication.shared.runLoopIterate()
		}
	}
	
	func run() {
		fuGraphicsRun()
	}
	
	func runLoopIterate() {
		if self.eventQueue.isEmpty == false {
			let event = self.eventQueue.removeFirst()
			event.window.send(event: event)
		}
		for window in self.windows {
			window.update()
		}
	}
	
	func addWindow(window: FUWindow) {
		self.windows.append(window)
	}
	
	func post(event: FUEvent) {
		self.eventQueue.append(event)
	}
	
	private func windowForPoint(x: Int32, y: Int32) -> FUWindow? {
		for window in self.windows {
			if window.frame.contains(CGPoint(x: Int(x), y: Int(y))) {
				return window
			}
		}
		return nil
	}

}
