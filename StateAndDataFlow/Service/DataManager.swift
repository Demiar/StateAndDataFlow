//
//  DataManager.swift
//  StateAndDataFlow
//
//  Created by Алексей on 04.08.2021.
//

import Foundation


class DataManager {
    static var shared = DataManager()
    
    private let userDefaults = UserDefaults.standard
    
    private let jsonEncoder = JSONEncoder()
    private let jsonDecoder = JSONDecoder()
    
    private let key = "user"

    
    
    func getUser() -> UserManager {
        if let user = userDefaults.data(forKey: key) {
            do {
                let data = try jsonDecoder.decode(User.self, from: user)
                return UserManager(name: data.name, isRegistered: data.isRegistered)
            } catch {
                print("Unable to Encode Note (\(error))")
            }
        }
        return UserManager()
    }
    
    func saveUser(user: User) {
        do {
            let data = try jsonEncoder.encode(user)
            userDefaults.set(data, forKey: key)
        } catch {
            print("Unable to Encode Note (\(error))")
        }
    }
    
    func deleteUser() {
        userDefaults.removeObject(forKey: key)
    }
}
