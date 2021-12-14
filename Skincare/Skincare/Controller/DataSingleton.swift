//
//  DataSingleton.swift
//  Skincare
//
//  Created by Gabriel Batista Cristiano on 11/12/21.
//

import Foundation

class Helper {
    static let shared = Helper()
    
    var objects = SkinTypeViewController()
    private init () {}
    
}
