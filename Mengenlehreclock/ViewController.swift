//
//  ViewController.swift
//  Mengenlehreclock
//
//  Created by Karl Sigiscar on 22/02/2019.
//  Copyright © 2019 ObjectMentor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var mengerlehreclockView: MengenlehreclockView!
    
    var viewModel:ViewModel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        viewModel = ViewModel(withDelegate: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension ViewController : ViewModelDelegate {
    func converter(_ converter: MengenlehreclockConverter, didTickWithTime time: Date) {
        
        let isSecondsLampOn = converter.secondsLampFor(time: time)
        let minutesRowIndex = converter.fiveMinutesRow(time: time)
        let singleMinutesRowIndex = converter.singleMinutesRowFor(time: time)
        let fiveHoursRowIndex = converter.fiveHoursRow(time: time)
        let singleHoursRowIndex = converter.singleHoursRow(time: time)
        
        mengerlehreclockView.updateClockWith(isSecondsLampOn: isSecondsLampOn,
                                             minutesRowIndex: minutesRowIndex,
                                             singleMinutesRowIndex: singleMinutesRowIndex,
                                             fiveHoursRowIndex: fiveHoursRowIndex,
                                             singleHoursRowIndex: singleHoursRowIndex)
        
        print("isSecondsLampON:\(converter.secondsLampFor(time: time))")
    }
}
