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
    var dateFor_05_05_05:Date!
    var dateFor_06_06_06:Date!
    var dateFor_07_07_07:Date!
    var dateFor_08_08_08:Date!
    var dateFor_09_09_09:Date!
    var dateFor_10_10_10:Date!
    var dateFor_11_11_11:Date!
    var dateFor_12_12_12:Date!
    var dateFor_13_13_13:Date!
    var dateFor_14_14_14:Date!
    var dateFor_15_15_15:Date!
    var dateFor_16_16_16:Date!
    var dateFor_17_17_17:Date!
    var dateFor_18_18_18:Date!
    var dateFor_19_19_19:Date!
    var dateFor_20_20_20:Date!
    var dateFor_21_21_21:Date!
    var dateFor_22_22_22:Date!
    var dateFor_23_23_23:Date!
    var dateFor_23_24_24:Date!
    var dateFor_23_25_25:Date!
    var dateFor_23_26_26:Date!
    var dateFor_23_27_27:Date!
    var dateFor_23_28_28:Date!
    var dateFor_23_29_29:Date!
    var dateFor_23_30_30:Date!
    var dateFor_23_31_31:Date!
    var dateFor_23_32_32:Date!
    var dateFor_23_33_33:Date!
    var dateFor_23_34_34:Date!
    var dateFor_23_35_35:Date!
    var dateFor_23_36_36:Date!
    var dateFor_23_37_37:Date!
    var dateFor_23_38_38:Date!
    var dateFor_23_39_39:Date!
    var dateFor_23_40_40:Date!
    var dateFor_23_41_41:Date!
    var dateFor_23_42_42:Date!
    var dateFor_23_43_43:Date!
    var dateFor_23_44_44:Date!
    var dateFor_23_45_45:Date!
    var dateFor_23_46_46:Date!
    var dateFor_23_47_47:Date!
    var dateFor_23_48_48:Date!
    var dateFor_23_49_49:Date!
    var dateFor_23_50_50:Date!
    var dateFor_23_51_51:Date!
    var dateFor_23_52_52:Date!
    var dateFor_23_53_53:Date!
    var dateFor_23_54_54:Date!
    var dateFor_23_55_55:Date!
    var dateFor_23_56_56:Date!
    var dateFor_23_57_57:Date!
    var dateFor_23_58_58:Date!
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
        dateFor_05_05_05 = formatter.date(from: "1972-04-30 05:05:05")
        dateFor_06_06_06 = formatter.date(from: "1972-04-30 06:06:06")
        dateFor_07_07_07 = formatter.date(from: "1972-04-30 07:07:07")
        dateFor_08_08_08 = formatter.date(from: "1972-04-30 08:08:08")
        dateFor_09_09_09 = formatter.date(from: "1972-04-30 09:09:09")
        dateFor_10_10_10 = formatter.date(from: "1972-04-30 10:10:10")
        dateFor_11_11_11 = formatter.date(from: "1972-04-30 11:11:11")
        dateFor_12_12_12 = formatter.date(from: "1972-04-30 12:12:12")
        dateFor_13_13_13 = formatter.date(from: "1972-04-30 13:13:13")
        dateFor_14_14_14 = formatter.date(from: "1972-04-30 14:14:14")
        dateFor_15_15_15 = formatter.date(from: "1972-04-30 15:15:15")
        dateFor_16_16_16 = formatter.date(from: "1972-04-30 16:16:16")
        dateFor_17_17_17 = formatter.date(from: "1972-04-30 17:17:17")
        dateFor_18_18_18 = formatter.date(from: "1972-04-30 18:18:18")
        dateFor_19_19_19 = formatter.date(from: "1972-04-30 19:19:19")
        dateFor_20_20_20 = formatter.date(from: "1972-04-30 20:20:20")
        dateFor_21_21_21 = formatter.date(from: "1972-04-30 21:21:21")
        dateFor_22_22_22 = formatter.date(from: "1972-04-30 22:22:22")
        dateFor_23_23_23 = formatter.date(from: "1972-04-30 23:23:23")
        dateFor_23_24_24 = formatter.date(from: "1972-04-30 23:24:24")
        dateFor_23_25_25 = formatter.date(from: "1972-04-30 23:25:25")
        dateFor_23_26_26 = formatter.date(from: "1972-04-30 23:26:26")
        dateFor_23_27_27 = formatter.date(from: "1972-04-30 23:27:27")
        dateFor_23_28_28 = formatter.date(from: "1972-04-30 23:28:28")
        dateFor_23_29_29 = formatter.date(from: "1972-04-30 23:29:29")
        dateFor_23_30_30 = formatter.date(from: "1972-04-30 23:30:30")
        dateFor_23_31_31 = formatter.date(from: "1972-04-30 23:31:31")
        dateFor_23_32_32 = formatter.date(from: "1972-04-30 23:32:32")
        dateFor_23_33_33 = formatter.date(from: "1972-04-30 23:33:33")
        dateFor_23_34_34 = formatter.date(from: "1972-04-30 23:34:34")
        dateFor_23_35_35 = formatter.date(from: "1972-04-30 23:35:35")
        dateFor_23_36_36 = formatter.date(from: "1972-04-30 23:36:36")
        dateFor_23_37_37 = formatter.date(from: "1972-04-30 23:37:37")
        dateFor_23_38_38 = formatter.date(from: "1972-04-30 23:38:38")
        dateFor_23_39_39 = formatter.date(from: "1972-04-30 23:39:39")
        dateFor_23_40_40 = formatter.date(from: "1972-04-30 23:40:40")
        dateFor_23_41_41 = formatter.date(from: "1972-04-30 23:41:41")
        dateFor_23_42_42 = formatter.date(from: "1972-04-30 23:42:42")
        dateFor_23_43_43 = formatter.date(from: "1972-04-30 23:43:43")
        dateFor_23_44_44 = formatter.date(from: "1972-04-30 23:44:44")
        dateFor_23_45_45 = formatter.date(from: "1972-04-30 23:45:45")
        dateFor_23_46_46 = formatter.date(from: "1972-04-30 23:46:46")
        dateFor_23_47_47 = formatter.date(from: "1972-04-30 23:47:47")
        dateFor_23_48_48 = formatter.date(from: "1972-04-30 23:48:48")
        dateFor_23_49_49 = formatter.date(from: "1972-04-30 23:49:49")
        dateFor_23_50_50 = formatter.date(from: "1972-04-30 23:50:50")
        dateFor_23_51_51 = formatter.date(from: "1972-04-30 23:51:51")
        dateFor_23_52_52 = formatter.date(from: "1972-04-30 23:52:52")
        dateFor_23_53_53 = formatter.date(from: "1972-04-30 23:53:53")
        dateFor_23_54_54 = formatter.date(from: "1972-04-30 23:54:54")
        dateFor_23_55_55 = formatter.date(from: "1972-04-30 23:55:55")
        dateFor_23_56_56 = formatter.date(from: "1972-04-30 23:56:56")
        dateFor_23_57_57 = formatter.date(from: "1972-04-30 23:57:57")
        dateFor_23_58_58 = formatter.date(from: "1972-04-30 23:58:58")
        dateFor_23_59_59 = formatter.date(from: "1972-04-30 23:59:59")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        converter.stop()
        converter = nil
        formatter = nil
    }

//    func testSingleMinutesRow() {
//        XCTAssertTrue(converter.isRunning)
//        XCTAssertEqual(converter.singleMinutesRowFor(time:dateForMidnight), -1)
//        XCTAssertEqual(converter.singleMinutesRowFor(time:dateForEightFiftyFourFiftyNine), 10)
//    }
//
//    func testFiveMinutesRow() {
//        XCTAssertTrue(converter.isRunning)
//        XCTAssertEqual(converter.fiveMinutesRow(time:dateForMidnight), -1)
//        XCTAssertEqual(converter.fiveMinutesRow(time:dateForEightFiftyFourFiftyNine), -1)
//        XCTAssertEqual(converter.fiveMinutesRow(time:dateForTwentyThreeFiftyNineFiftyNine), 3)
//    }
    
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
