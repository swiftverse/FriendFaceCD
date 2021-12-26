//
//  DataController.swift
//  FriendFaceCD
//
//  Created by Amit Shrivastava on 23/12/21.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "FriendFaceCD")
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("data cannot be loaded \(error.localizedDescription)")
            }
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
            
        }
    }
}
