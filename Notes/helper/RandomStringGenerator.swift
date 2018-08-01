//
//  RandomStringGenerator.swift
//  Notes
//
//  Created by Arifin Firdaus on 8/1/18.
//  Copyright © 2018 Arifin Firdaus. All rights reserved.
//

import Foundation

struct RandomStringGenerator {
    
    static func getRandomString(length: Int) -> String {
        let letters: NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        return randomString
    }
}
