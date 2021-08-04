//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by 18992227 on 02.08.2021.
//

import Combine

final class UserManager: ObservableObject {
    @Published var isRegistered = false
	var name = ""

	init() {}

    init(name: String, isRegistered: Bool) {
		self.name = name
        self.isRegistered = isRegistered
	}

}
