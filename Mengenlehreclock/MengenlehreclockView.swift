//
//  MengenlehreclockView.swift
//  Mengenlehreclock
//
//  Created by Karl Sigiscar on 25/02/2019.
//  Copyright © 2019 ObjectMentor. All rights reserved.
//

import UIKit

class MengenlehreclockView: UIView, MengenlehreclockUpdatable {
    
    private var borderStartColor:UIColor! = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
    private var borderEndColor:UIColor! = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1)
    private var minutesStartColor:UIColor! = UIColor(red: 0.6, green: 0.4, blue: 0, alpha: 1)
    private var minutesEndColor:UIColor! = UIColor(red: 0.5, green: 0.3, blue: 0, alpha: 1)
    private var minutesHighlightedStartColor:UIColor! = UIColor(red: 1.0, green: 0.8, blue: 0, alpha: 1)
    private var minutesHighlightedEndColor:UIColor! = UIColor(red: 0.8, green: 0.6, blue: 0, alpha: 1)
    private var hoursStartColor:UIColor! = UIColor(red: 0.6, green: 0.3, blue: 0.0, alpha: 1)
    private var hoursEndColor:UIColor! = UIColor(red: 0.8, green: 0.4, blue: 0.1, alpha: 1)
    private var hoursHighlightedStartColor:UIColor! = UIColor(red: 0.8, green: 0.4, blue: 0.1, alpha: 1)
    private var hoursHighlightedEndColor:UIColor! =  UIColor(red: 1, green: 0.5, blue: 0.2, alpha: 1)

    var isSecondsLampOn:Bool!
    var minutesRowIndex:Int!
    var singleMinutesRowIndex:Int!
    var fiveHoursRowIndex:Int!
    var singleHoursRowIndex:Int!
    
    var centerX:CGFloat!
    var centerY:CGFloat!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func updateClockWith(isSecondsLampOn:Bool,
                         minutesRowIndex:Int,
                         singleMinutesRowIndex:Int,
                         fiveHoursRowIndex:Int,
                         singleHoursRowIndex:Int) {
 
        self.isSecondsLampOn = isSecondsLampOn
        self.minutesRowIndex = minutesRowIndex
        self.singleMinutesRowIndex = singleMinutesRowIndex
        self.fiveHoursRowIndex = fiveHoursRowIndex
        self.singleHoursRowIndex = singleHoursRowIndex
        
        setNeedsDisplay()
    }
    
    override func prepareForInterfaceBuilder() {
    }
    
    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.clear(rect)
        centerX = rect.width / 2
        centerY = rect.height / 2
        drawSecondsLamp(in: context)
        drawFiveHoursRow(in: context)
        drawSingleHoursRow(in: context)
        drawFiveMinutesRow(in: context)
        drawSingleMinutesRow(in: context)
        drawSeparators(in: context)
        
        super.draw(rect)
    }
    
    func drawCircle(in context: CGContext) {
        let RADIUS:CGFloat = 100
        
        var colors:[CGColor]
    
        guard isSecondsLampOn != nil  else {
            return
        }
        
        if isSecondsLampOn {
            colors = [minutesHighlightedStartColor.cgColor, minutesHighlightedEndColor.cgColor]
        }
        else
        {
            colors = [minutesStartColor.cgColor, minutesEndColor.cgColor]
        }
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colorLocations: [CGFloat] = [0.0, 1.0]

        let gradient = CGGradient(colorsSpace: colorSpace,
                                  colors: colors as CFArray,
                                  locations: colorLocations)!

        let startPoint = CGPoint(x: centerX, y: RADIUS + RADIUS / 2)
        let endPoint = CGPoint(x: centerX, y: RADIUS + RADIUS / 2)
        
        context.drawRadialGradient(gradient, startCenter: startPoint, startRadius: 0, endCenter: endPoint, endRadius: RADIUS, options: [])
    }
    
    private func drawSecondsLamp(in context:CGContext) {
        drawCircle(in: context)
    }
    
    private func drawFiveMinutesRow(in context:CGContext) {
    }
    
    private func drawSingleMinutesRow(in context:CGContext) {
    }
    
    private func drawFiveHoursRow(in context:CGContext) {
    }
    
    private func drawSingleHoursRow(in context:CGContext) {
    }
    
    private func drawSeparators(in context:CGContext) {
    }
}
