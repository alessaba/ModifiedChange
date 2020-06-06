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
	@IBOutlet weak var dateField: NSTextField!
	@IBOutlet weak var changeButton: NSButton!
	
	@IBAction func changeBtnPressed(_ sender: Any) {
		let dateValue = dateField.stringValue
		.replacingOccurrences(of: "/", with: "")
		.replacingOccurrences(of: ":", with: "")
		.replacingOccurrences(of: " ", with: "")
		
		let filepath = fileField.stringValue
			.replacingOccurrences(of: " ", with: "\\ ")
		
		changeDate(filepath: filepath, date: dateValue)
		
		changeButton.contentTintColor = .green
	}
	
}

func changeDate(filepath : String, date : String){
	let process = Process()
	process.launchPath = "/usr/bin/touch"
	process.arguments = ["-mt", date, filepath]
	process.launch()
}

