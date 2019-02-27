//
//  ViewModel.swift
//  Mengenlehreclock
//
//  Created by Karl Sigiscar on 27/02/2019.
//  Copyright © 2019 Karl Sigiscar. All rights reserved.
//

import UIKit

protocol ViewModelDelegate : class {
    func converter(_ converter:MengenlehreclockConverter, didTickWithTime time:Date)
}

class ViewModel {
    
    let converter = MengenlehreclockConverter()
    weak var delegate:ViewModelDelegate?
    
    init(withDelegate delegate:UIViewController & ViewModelDelegate) {
        self.delegate = delegate
        converter.start()
        NotificationCenter.default.addObserver(self, selector: #selector(converterTimerTick), name: MengenlehreclockConverter.MengenlehreclockTimeTick, object: nil)
    }
    
    @objc func converterTimerTick (_ notification: Notification) {
        if let date = notification.userInfo?["date"] as? Date {
            delegate?.converter(converter, didTickWithTime: date)
        }
    }
}
