//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by 18992227 on 02.08.2021.
//

import SwiftUI

struct RegisterView: View {
	@State private var name = ""
	@EnvironmentObject var user: UserManager

    var body: some View {
		VStack {
            HStack {
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                Text(String(name.count))
                    .foregroundColor(name.count < 3 ? .red : .green)
                    .padding()
            }
            .padding()
			Button(action: registerUser, label: {
				HStack {
					Image(systemName: "checkmark.circle")
					Text("OK")
				}
            }).disabled(name.count < 3)
		}
    }
}

extension RegisterView {
	private func registerUser() {
        if name.count > 2 {
			user.name = name
			user.isRegistered = true
            DataManager.shared.saveUser(user: User(name: name, isRegistered: true))
		}
	}
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
		RegisterView().environmentObject(UserManager())
    }
}
