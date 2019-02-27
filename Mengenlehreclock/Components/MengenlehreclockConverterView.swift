//
//  MengenlehreclockConverterView.swift
//  Mengenlehreclock
//
//  Created by Karl Sigiscar on 25/02/2019.
//  Copyright © 2019 ObjectMentor. All rights reserved.
//

import UIKit

@IBDesignable
class MengenlehreclockConverterView: UIView, MengenlehreclockUpdatable {
    
    @IBInspectable
    private var borderColor:UIColor! = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)

    @IBInspectable
    private var minutesColor:UIColor! = UIColor(red: 1, green: 0.8, blue: 0, alpha: 1)
    
    @IBInspectable
    private var minutesColorHighlighted:UIColor! = UIColor.yellow
    
    @IBInspectable
    private var hoursColor:UIColor! = UIColor(red: 1, green: 0.5, blue: 0, alpha: 1)
    
    @IBInspectable
    private var hoursColorHighlighted:UIColor! = UIColor.orange
    
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
    }
    
    func drawCircle(in context: CGContext) {
        let RADIUS:CGFloat = 100
        let BORDER_THICKNESS:CGFloat = 10
        
        let strokeRect = CGRect(x: centerX - RADIUS / 2 - BORDER_THICKNESS / 2,
                                y: RADIUS / 2 - BORDER_THICKNESS / 2,
                                width: RADIUS + BORDER_THICKNESS,
                                height: RADIUS + BORDER_THICKNESS)
        
        context.setStrokeColor(borderColor.cgColor)
        context.setLineWidth(BORDER_THICKNESS)
        context.addEllipse(in: strokeRect)
        context.drawPath(using: .stroke)
        
        let fillRect = CGRect(x: centerX - RADIUS / 2,
                              y: RADIUS / 2,
                              width: RADIUS,
                              height: RADIUS)
        
        context.setFillColor(minutesColor.cgColor)
        context.addEllipse(in: fillRect)
        context.drawPath(using: .fill)
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
