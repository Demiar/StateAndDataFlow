//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by 18992227 on 02.08.2021.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    var body: some Scene {
        WindowGroup {
            StarterView().environmentObject(DataManager.shared.getUser())
        }
    }
}
