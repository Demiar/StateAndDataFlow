//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by 18992227 on 02.08.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var user: UserManager
	@StateObject private var timer = TimerCounter()

	var body: some View {
		VStack {
			Text("Hi! \(user.name)")
				.font(.largeTitle)
				.offset(x: 0, y: 100)

			Text("\(timer.counter)")
				.font(.largeTitle)
				.offset(x: 0, y: 200)

			Spacer()

            ButtonView(title: timer.buttonTitle ,function: startTimer)
                .disabled(timer.buttonTitle == "Wait..." ? true : false)
            ButtonView(title: "Log Out" ,function: logOut)

			Spacer()
            
		}
    }
}

extension ContentView {
    private func startTimer() {
        self.timer.startTimer()
    }
    
    private func logOut() {
        user.isRegistered = false
        DataManager.shared.deleteUser()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView().environmentObject(UserManager())
    }
}


