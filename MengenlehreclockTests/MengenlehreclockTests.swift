//
//  MengenlehreclockTests.swift
//  MengenlehreclockTests
//
//  Created by Karl Sigiscar on 22/02/2019.
//  Copyright © 2019 ObjectMentor. All rights reserved.
//

import XCTest
@testable import Mengenlehreclock

class MengenlehreclockTests: XCTestCase {

    var converter:MengenlehreclockConverter!
    var formatter:DateFormatter! = nil
    
    // Dates for minutes

    var dateFor_00_00_00:Date!
    var dateFor_01_01_01:Date!
    var dateFor_02_02_02:Date!
    var dateFor_03_03_03:Date!
    var dateFor_04_04_04:Date!
    var dateFor_11_11_11:Date!
    var dateFor_15_15_15:Date!
    var dateFor_17_17_17:Date!
    var dateFor_23_45_45:Date!
    var dateFor_23_50_50:Date!
    var dateFor_23_55_55:Date!
    var dateFor_23_59_59:Date!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        converter = MengenlehreclockConverter()
        converter.start()
        formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        dateFor_00_00_00 = formatter.date(from: "1972-04-30 00:00:00")
        dateFor_01_01_01 = formatter.date(from: "1972-04-30 01:01:01")
        dateFor_02_02_02 = formatter.date(from: "1972-04-30 02:02:02")
        dateFor_03_03_03 = formatter.date(from: "1972-04-30 03:03:03")
        dateFor_04_04_04 = formatter.date(from: "1972-04-30 04:04:04")
        dateFor_11_11_11 = formatter.date(from: "1972-04-30 11:11:11")
        dateFor_15_15_15 = formatter.date(from: "1972-04-30 15:15:15")
        dateFor_17_17_17 = formatter.date(from: "1972-04-30 17:17:17")
        dateFor_23_45_45 = formatter.date(from: "1972-04-30 23:45:45")
        dateFor_23_50_50 = formatter.date(from: "1972-04-30 23:50:50")
        dateFor_23_55_55 = formatter.date(from: "1972-04-30 23:55:55")
        dateFor_23_59_59 = formatter.date(from: "1972-04-30 23:59:59")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        converter.stop()
        converter = nil
        formatter = nil
    }
    
    func testSecondsLamp() {
        XCTAssertTrue(converter.isRunning)
        XCTAssertTrue(converter.secondsLampFor(time:dateFor_00_00_00))
        XCTAssertFalse(converter.secondsLampFor(time:dateFor_01_01_01))
        XCTAssertTrue(converter.secondsLampFor(time:dateFor_02_02_02))
        XCTAssertFalse(converter.secondsLampFor(time:dateFor_03_03_03))
    }

    func testSingleMinutesRow() {
        XCTAssertTrue(converter.isRunning)
        XCTAssertEqual(converter.singleMinutesRowFor(time:dateFor_00_00_00), -1)
        XCTAssertEqual(converter.singleMinutesRowFor(time:dateFor_01_01_01), 0)
        XCTAssertEqual(converter.singleMinutesRowFor(time:dateFor_02_02_02), 1)
        XCTAssertEqual(converter.singleMinutesRowFor(time:dateFor_03_03_03), 2)
        XCTAssertEqual(converter.singleMinutesRowFor(time:dateFor_04_04_04), 3)
    }

    func testFiveMinutesRow() {
        XCTAssertTrue(converter.isRunning)
        XCTAssertEqual(converter.fiveMinutesRow(time:dateFor_00_00_00), -1)
        XCTAssertEqual(converter.fiveMinutesRow(time:dateFor_15_15_15), 2)
        XCTAssertEqual(converter.fiveMinutesRow(time:dateFor_23_45_45), 8)
        XCTAssertEqual(converter.fiveMinutesRow(time:dateFor_23_50_50), 9)
        XCTAssertEqual(converter.fiveMinutesRow(time:dateFor_23_55_55), 10)
    }
    
    func testSingleHoursRow() {
        XCTAssertTrue(converter.isRunning)
        XCTAssertEqual(converter.singleHoursRow(time:dateFor_00_00_00), -1)
        XCTAssertEqual(converter.singleHoursRow(time:dateFor_01_01_01), 0)
        XCTAssertEqual(converter.singleHoursRow(time:dateFor_02_02_02), 1)
        XCTAssertEqual(converter.singleHoursRow(time:dateFor_03_03_03), 2)
        XCTAssertEqual(converter.singleHoursRow(time:dateFor_04_04_04), 3)
        XCTAssertEqual(converter.singleHoursRow(time:dateFor_17_17_17), 1)
        XCTAssertEqual(converter.singleHoursRow(time:dateFor_23_59_59), 2)
    }
    
    func testFiveHoursRow() {
        XCTAssertTrue(converter.isRunning)
        XCTAssertEqual(converter.fiveHoursRow(time:dateFor_00_00_00), -1)
        XCTAssertEqual(converter.fiveHoursRow(time:dateFor_11_11_11), 1)
        XCTAssertEqual(converter.fiveHoursRow(time:dateFor_17_17_17), 2)
        XCTAssertEqual(converter.fiveHoursRow(time:dateFor_23_59_59), 3)
    }
}
