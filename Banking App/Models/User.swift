//
//  User.swift
//  Banking App
//
//  Created by Ahmed Yamany on 03/11/2022.
//

import Foundation

struct User: Equatable{
    let name: String
    let email: String
    let balance: Double
    let image = "https://thispersondoesnotexist.com/image"
    
    static func ==(lhs: User, rhs: User) -> Bool{
        return lhs.name == rhs.name && lhs.email == rhs.email
    }
    
}
