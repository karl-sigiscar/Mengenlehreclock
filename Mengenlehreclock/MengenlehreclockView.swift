//
//  MengenlehreclockView.swift
//  Mengenlehreclock
//
//  Created by Karl Sigiscar on 25/02/2019.
//  Copyright © 2019 Karl Sigiscar. All rights reserved.
//

import UIKit

class MengenlehreclockView: UIView, MengenlehreclockUpdatable {
    
    private var GAP:CGFloat = 10
    
    private var borderStartColor:UIColor! = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
    private var borderEndColor:UIColor! = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1)
    private var minutesStartColor:UIColor! = UIColor(red: 0.6, green: 0.4, blue: 0, alpha: 1)
    private var minutesEndColor:UIColor! = UIColor(red: 0.5, green: 0.3, blue: 0, alpha: 1)
    private var minutesHighlightedStartColor:UIColor! = UIColor.yellow
    private var minutesHighlightedEndColor:UIColor! = UIColor(red: 0.8, green: 0.6, blue: 0, alpha: 1)
    private var hoursStartColor:UIColor! = UIColor(red: 0.6, green: 0.3, blue: 0.0, alpha: 1)
    private var hoursEndColor:UIColor! = UIColor(red: 0.8, green: 0.4, blue: 0.1, alpha: 1)
    private var hoursHighlightedStartColor:UIColor! = UIColor(red: 0.8, green: 0.4, blue: 0.1, alpha: 1)
    private var hoursHighlightedEndColor:UIColor! =  UIColor(red: 1, green: 0.5, blue: 0.2, alpha: 1)
    private var separatorColor:UIColor! = UIColor.black

    private var isSecondsLampOn:Bool!
    private var fiveMinutesRowIndex:Int!
    private var singleMinutesRowIndex:Int!
    private var fiveHoursRowIndex:Int!
    private var singleHoursRowIndex:Int!
    
    private var centerX:CGFloat!
    private var centerY:CGFloat!
    private var rowHeight:CGFloat!
    
    func updateClockWith(isSecondsLampOn:Bool,
                         fiveMinutesRowIndex:Int,
                         singleMinutesRowIndex:Int,
                         fiveHoursRowIndex:Int,
                         singleHoursRowIndex:Int) {
 
        self.isSecondsLampOn = isSecondsLampOn
        self.fiveMinutesRowIndex = fiveMinutesRowIndex
        self.singleMinutesRowIndex = singleMinutesRowIndex
        self.fiveHoursRowIndex = fiveHoursRowIndex
        self.singleHoursRowIndex = singleHoursRowIndex
        
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.clear(rect)
        
        centerX = rect.width / 2
        centerY = rect.height / 2
        rowHeight = rect.size.height / 10
        
        drawSecondsLamp(in: context)
        drawFiveHoursRow(in: context)
        drawSingleHoursRow(in: context)
        drawFiveMinutesRow(in: context)
        drawSingleMinutesRow(in: context)
        drawBackground(in: context)
        
        super.draw(rect)
    }
    
    private func drawSecondsLamp(in context:CGContext) {
        
        let RADIUS:CGFloat = bounds.width / 4
        var colors:[CGColor]
    
        guard isSecondsLampOn != nil  else {
            return
        }
        
        if isSecondsLampOn {
            colors = [minutesHighlightedStartColor.cgColor, minutesHighlightedEndColor.cgColor]
        }
        else {
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
    
    private func drawTimeChips(width: CGFloat,
                               height: CGFloat,
                               y:CGFloat,
                               innerGap:CGFloat,
                               outerGap:CGFloat,
                               normalColor:CGColor,
                               highlightColor:CGColor,
                               numberOfChips:Int,
                               context: CGContext,
                               index:Int) {
        
        for i in 0..<numberOfChips {

            let rect = CGRect(x: outerGap + CGFloat(i) * (width + innerGap), y: y, width: width, height: height)
            let path = UIBezierPath.init(roundedRect: rect, cornerRadius: 10)

            if i <= index {
                context.setFillColor(highlightColor)
            }
            else {
                context.setFillColor(normalColor)
            }

            path.fill()
        }
    }

    private func drawFiveHoursRow(in context:CGContext) {
        
        let NUMBER_OF_CHIPS = 4
        let WIDTH:CGFloat = ((bounds.width - (GAP * (CGFloat(NUMBER_OF_CHIPS) + 1))) / CGFloat(NUMBER_OF_CHIPS))
        let HEIGHT:CGFloat = bounds.height / 12
        
        guard fiveHoursRowIndex != nil  else {
            return
        }
        
        drawTimeChips(width: WIDTH,
                      height: HEIGHT,
                      y:centerY - rowHeight,
                      innerGap: GAP,
                      outerGap: GAP,
                      normalColor:UIColor.orange.cgColor,
                      highlightColor:UIColor.red.cgColor,
                      numberOfChips:NUMBER_OF_CHIPS,
                      context: context,
                      index:fiveHoursRowIndex)
    }
    
    private func drawSingleHoursRow(in context:CGContext) {
        
        let NUMBER_OF_CHIPS = 4
        let WIDTH:CGFloat = ((bounds.width - (GAP * (CGFloat(NUMBER_OF_CHIPS) + 1))) / CGFloat(NUMBER_OF_CHIPS))
        let HEIGHT:CGFloat = bounds.height / 12

        guard singleHoursRowIndex != nil  else {
            return
        }
        
        drawTimeChips(width: WIDTH,
                      height: HEIGHT,
                      y:centerY,
                      innerGap: GAP,
                      outerGap: GAP,
                      normalColor:UIColor.orange.cgColor,
                      highlightColor:UIColor.red.cgColor,
                      numberOfChips:NUMBER_OF_CHIPS,
                      context: context,
                      index:singleHoursRowIndex)
    }

    private func drawFiveMinutesRow(in context:CGContext) {
        
        let NUMBER_OF_CHIPS = 11
        let SMALL_GAP:CGFloat = GAP / 2
        let WIDTH:CGFloat = ((bounds.width - 2 * GAP - (SMALL_GAP * (CGFloat(NUMBER_OF_CHIPS) - 1))) / CGFloat(NUMBER_OF_CHIPS))
        let HEIGHT:CGFloat = bounds.height / 12
        
        guard fiveMinutesRowIndex != nil  else {
            return
        }
        
        drawTimeChips(width: WIDTH,
                      height: HEIGHT,
                      y:centerY + rowHeight,
                      innerGap: SMALL_GAP,
                      outerGap: GAP,
                      normalColor:UIColor.brown.cgColor,
                      highlightColor:UIColor.yellow.cgColor,
                      numberOfChips:NUMBER_OF_CHIPS,
                      context: context,
                      index:fiveMinutesRowIndex)
    }
    
    private func drawSingleMinutesRow(in context:CGContext) {
        
        let NUMBER_OF_CHIPS = 4
        let WIDTH:CGFloat = ((bounds.width - (GAP * (CGFloat(NUMBER_OF_CHIPS) + 1))) / CGFloat(NUMBER_OF_CHIPS))
        let HEIGHT:CGFloat = bounds.height / 12

        guard singleMinutesRowIndex != nil  else {
            return
        }
        
        drawTimeChips(width: WIDTH,
                      height: HEIGHT,
                      y:centerY + rowHeight * 2,
                      innerGap: GAP,
                      outerGap: GAP,
                      normalColor:UIColor.brown.cgColor,
                      highlightColor:UIColor.yellow.cgColor,
                      numberOfChips:NUMBER_OF_CHIPS,
                      context: context,
                      index:singleMinutesRowIndex)
    }
    
    private func drawBackground(in context:CGContext) {
    }
}
