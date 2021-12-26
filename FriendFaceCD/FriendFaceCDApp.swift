//
//  FriendFaceCDApp.swift
//  FriendFaceCD
//
//  Created by Amit Shrivastava on 23/12/21.
//

import SwiftUI

@main
struct FriendFaceCDApp: App {
    @StateObject var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            FriendFaceCD()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
