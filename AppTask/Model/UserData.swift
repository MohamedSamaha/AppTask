//
//  UserData.swift
//  AppTask
//
//  Created by Mohamed Samaha on 09/03/2023.
//

import Foundation

struct UserData: Codable {
    let users: [Users]
    
}
struct Users: Codable {
    let firstName: String
    let lastName: String
}
