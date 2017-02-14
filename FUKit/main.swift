//
//  main.swift
//  FUKit
//
//  Created by Craig Edwards on 14/02/2017.
//  Copyright © 2017 BlackDog Foundry Pty Ltd. All rights reserved.
//

import Foundation

let app = FUApplication.shared
let game = Game(frame: NSRect(x: 0, y: 0, width: 736, height: 414))
app.addWindow(window: game)
game.start()
app.run()
