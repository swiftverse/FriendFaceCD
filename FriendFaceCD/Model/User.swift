//
//  User.swift
//  FriendFaceCD
//
//  Created by Amit Shrivastava on 23/12/21.
//

import Foundation
import SwiftUI

struct User: Codable, Identifiable {
    var name: String
    var id: UUID
    var isActive: Bool
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date?
    var tags: [String]
    var friends: [Friend]
    
    var dateFormatString: String {
        registered?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
