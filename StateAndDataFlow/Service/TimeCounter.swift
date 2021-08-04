//
//  TimeCounter.swift
//  StateAndDataFlow
//
//  Created by 18992227 on 02.08.2021.
//

import Combine
import Foundation

class TimerCounter: ObservableObject {
	let objectWillChange = PassthroughSubject<TimerCounter, Never>()

	var counter = 5
	var timer: Timer?
	var buttonTitle = "Start"
    var buttonPressed = false

	func startTimer() {
		if counter > 0 {
            buttonPressed = true
			timer = Timer.scheduledTimer(
				timeInterval: 1,
				target: self,
				selector: #selector(updateCounter),
				userInfo: nil,
				repeats: true
			)
		}
		buttonDidTapped()
        buttonPressed = false
	}

	private func buttonDidTapped() {
		if buttonTitle == "Reset" {
			counter = 5
			buttonTitle = "Start"
		} else {
			buttonTitle = "Wait..."
		}

		objectWillChange.send(self)
	}

	@objc private func updateCounter() {
		if counter > 0 {
			counter -= 1
		} else {
			killTimer()
			buttonTitle = "Reset"
		}

		objectWillChange.send(self)
	}

	private func killTimer() {
		timer?.invalidate()
		timer = nil
	}
}
