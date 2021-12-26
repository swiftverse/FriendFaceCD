//
//  Friend.swift
//  FriendFaceCD
//
//  Created by Amit Shrivastava on 23/12/21.
//

import Foundation
import SwiftUI

struct Friend: Codable, Identifiable {
    var name: String
    var id: UUID
}
