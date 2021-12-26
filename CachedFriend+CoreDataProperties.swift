//
//  CachedFriend+CoreDataProperties.swift
//  FriendFaceCD
//
//  Created by Amit Shrivastava on 23/12/21.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: UUID
    @NSManaged public var users: CachedUser?
    
    
   
    
    public var wrappedName: String {
        name ?? "Unknown Name"
    }
    

}

extension CachedFriend : Identifiable {

}
