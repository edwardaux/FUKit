//
//  FUColor.swift
//  FUKit
//
//  Created by Craig Edwards on 14/02/2017.
//  Copyright © 2017 BlackDog Foundry Pty Ltd. All rights reserved.
//

import Foundation

enum FUColor {
	case black
	case white
	case cyan
	case magenta
	
	var rgba: (Float, Float, Float, Float) {
		switch self {
		case .black: return (0, 0, 0, 1)
		case .white: return (1, 1, 1, 1)
		case .cyan: return (0, 1, 1, 1)
		case .magenta: return (1, 0, 1, 1)
		}
	}
}
