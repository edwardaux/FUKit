//
//  main.swift
//  FUKit
//
//  Created by Craig Edwards on 14/02/2017.
//  Copyright © 2017 BlackDog Foundry Pty Ltd. All rights reserved.
//

import Foundation

let app = FUApplication.shared
app.addWindow(window: FUWindow(frame: NSRect(x: 10, y: 10, width: 150, height: 150)))
app.run()

