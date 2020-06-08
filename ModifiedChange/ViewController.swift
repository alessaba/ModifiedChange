//
//  ViewController.swift
//  ModifiedChange
//
//  Created by Alessandro Saba on 06/06/2020.
//  Copyright © 2020 Alessandro Saba. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

	@IBOutlet weak var fileField: NSTextField!
	
	@IBOutlet weak var yearField: NSTextField!
	@IBOutlet weak var monthField: NSTextField!
	@IBOutlet weak var dayField: NSTextField!
	@IBOutlet weak var hourField: NSTextField!
	@IBOutlet weak var minuteField: NSTextField!
	
	@IBOutlet weak var changeButton: NSButton!
	
	@IBAction func changeBtnPressed(_ sender: Any) {
		let filepath = fileField.stringValue
			.replacingOccurrences(of: " ", with: "\\ ")
		
		let dateValue = String(yearField.stringValue.dropFirst(2)) + monthField.stringValue + dayField.stringValue + hourField.stringValue + minuteField.stringValue
		
		changeDate(filepath: filepath, date: dateValue)
	}
	
}

func changeDate(filepath : String, date : String){
	let process = Process()
	process.launchPath = "/usr/bin/touch"
	process.arguments = ["-mt", date, filepath]
	process.launch()
}

