//
//  main.swift
//  FUKit
//
//  Created by Craig Edwards on 14/02/2017.
//  Copyright © 2017 BlackDog Foundry Pty Ltd. All rights reserved.
//

import Foundation

fuGraphicsSetup()
fuGraphicsSetDisplayFunction {
	let rect = NSRect(x: 100, y: 100, width: 200, height: 200)
	fuGraphicsDrawRect(rect, 0.0, 1.0, 0.0, 1.0)
}
fuGraphicsRun()

