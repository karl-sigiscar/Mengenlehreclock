//
//  MengenlehreclockConverter.swift
//  Mengenlehreclock
//
//  Created by Karl Sigiscar on 22/02/2019.
//  Copyright © 2019 Karl Sigiscar. All rights reserved.
//

import Foundation

class MengenlehreclockConverter {
    
    public static let MengenlehreclockTimeTick = NSNotification.Name(rawValue: "MengenlehreclockTimeTick")
    public var isRunning:Bool!
    
    private let SIZE_OF_MINUTE_BLOCKS:Int = 5
    private let SIZE_OF_HOUR_BLOCKS:Int = 5
    
    private var timer:Timer!
    private var timeInterval:TimeInterval!
    
    
    func start() {
        isRunning = true
        
        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true, block: { time in
            NotificationCenter.default.post(name: MengenlehreclockConverter.MengenlehreclockTimeTick, object: self, userInfo: ["date":Date()])
        })
    }
    
    func stop() {
        isRunning = false
        timer.invalidate()
    }
    
    init() {
        timeInterval = TimeInterval(1) // every second
    }
    
    func secondsLampFor(time:Date) -> Bool {
        let components = Calendar.current.dateComponents([.second], from: time)
        
        if let seconds = components.second {
            return (seconds % 2) == 0
        }
        
        return false
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
