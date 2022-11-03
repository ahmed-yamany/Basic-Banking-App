//
//  BankManager.swift
//  Banking App
//
//  Created by Ahmed Yamany on 03/11/2022.
//

import UIKit


class BankManager{
    static let shared = BankManager()
    private init(){}
    
    let users: [User] = [
        User(name: "Ahmed Yamany", email: "ahmed@gmail.com", balance: 150_000),
        User(name: "Eslam Mohammed", email: "eslam@gmail.com", balance: 30_000),
        User(name: "Saad ali", email: "saad@gmail.com", balance: 200_000),
        User(name: "Ali", email: "ali@gmail.com", balance: 3_000),
        
    ]

    
    func fetchImage(from url: URL) async throws -> UIImage {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
           httpResponse.statusCode == 200 else {
            throw BankControllerErrors.imageDataMissing
        }
        guard let image = UIImage(data: data) else {
            throw BankControllerErrors.imageDataMissing
        }
        
        return image
    }
    
}
