//
//  MengenlehreclockConverter.swift
//  Mengenlehreclock
//
//  Created by Karl Sigiscar on 22/02/2019.
//  Copyright © 2019 ObjectMentor. All rights reserved.
//

import Foundation

class MengenlehreclockConverter {
    
    private let NUMBER_OF_FIVE_MINUTES_ROW_LAMPS = 11
    private let SIZE_OF_MINUTE_BLOCKS:Int = 5
    private let NUMBER_OF_FIVE_HOUR_ROW_LAMPS = 4
    private let SIZE_OF_HOUR_BLOCKS:Int = 5
    var isRunning:Bool!
    
    func start() {
        isRunning = true
    }
    
    func stop() {
        isRunning = false
    }
    
    func singleMinutesRowFor(time:Date) -> Int {
        
        let components = Calendar.current.dateComponents([.minute], from: time)
        
        if let minutes = components.minute {
            if minutes > 0 {
                return (minutes % SIZE_OF_MINUTE_BLOCKS) - 1
            }
        }

        return -1
    }
    
    func fiveMinutesRow(time:Date) -> Int {
        
        let components = Calendar.current.dateComponents([.minute], from: time)

        if let minutes = components.minute {
            if minutes > 0 {
                return (minutes / SIZE_OF_MINUTE_BLOCKS) - 1
            }
        }
        
        return -1
    }
    
    func singleHoursRow(time:Date) -> Int {
        
        let components = Calendar.current.dateComponents([.hour], from: time)
        
        if let hours = components.hour {
            if hours > 0 {
                return (hours % SIZE_OF_HOUR_BLOCKS) - 1
            }
        }
        
        return -1
    }
    
    func fiveHoursRow(time:Date) -> Int {
        
        let components = Calendar.current.dateComponents([.hour], from: time)
        
        if let hours = components.hour {
            if hours > 0 {
                return (hours / SIZE_OF_HOUR_BLOCKS) - 1
            }
        }
        
        return -1
    }
}
