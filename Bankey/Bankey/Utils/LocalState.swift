//
//  LocalState.swift
//  Bankey
//
//  Created by Raghavendra Mirajkar on 08/08/24.
//

import Foundation

public class LocalState {
    
    private enum Keys: String {
        case hasOnboarded
    }
    
    public static var hasOnboarded : Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.hasOnboarded.rawValue)
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: Keys.hasOnboarded.rawValue)
            UserDefaults.standard.synchronize() // To avoid race cconditions
        }
    }
}
