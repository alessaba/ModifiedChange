//
//  ViewController.swift
//  ModifiedChange
//
//  Created by Alessandro Saba on 06/06/2020.
//  Copyright © 2020 Alessandro Saba. All rights reserved.
//

import Cocoa

struct Result {
	let code : Int
	let output : String
}

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
		
		let alert = NSAlert()
		
		let scriptResult = changeDate(filepath: filepath, date: dateValue)
		if (scriptResult.code == 0){
			alert.messageText = "Done!"
		} else {
			alert.messageText = "Error!"
			alert.informativeText = "You are not allowed to access this directory or it does not exixt"
		}
		
		alert.beginSheetModal(for: NSApplication.shared.keyWindow! , completionHandler: nil)
	}
	
}

func changeDate(filepath : String, date : String) -> Result {
	let process = Process()
	process.launchPath = "/usr/bin/touch"
	process.arguments = ["-mt", date, filepath]
	//process.standardOutput = outPipe
	process.launch()
	process.waitUntilExit()
	
	let ret = Result(code: Int(process.terminationStatus), output: "")
	
	return ret
}

