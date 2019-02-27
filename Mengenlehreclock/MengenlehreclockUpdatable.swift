//
//  MengenlehreclockUpdatable.swift
//  Mengenlehreclock
//
//  Created by Karl Sigiscar on 25/02/2019.
//  Copyright © 2019 Karl Sigiscar. All rights reserved.
//

import Foundation

/// A protocol implemented by any view component representing a Mengenlehreclock
protocol MengenlehreclockUpdatable {
    
    func updateClockWith(isSecondsLampOn:Bool,
                         minutesRowIndex:Int,
                         singleMinutesRowIndex:Int,
                         fiveHoursRowIndex:Int,
                         singleHoursRowIndex:Int);
}
