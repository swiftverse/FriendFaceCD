//
//  CachedUser+CoreDataProperties.swift
//  FriendFaceCD
//
//  Created by Amit Shrivastava on 23/12/21.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: UUID
    @NSManaged public var company: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var age: Int16
    @NSManaged public var email: String?
    @NSManaged public var address: String?
    @NSManaged public var about: String?
    @NSManaged public var registered: String?
    @NSManaged public var tags: String?
    @NSManaged public var friends: NSSet?
    
    public var wrappedName: String {
        name ?? "Name N/A"
    }
    
   
    
    public var wrappedCompany: String {
        company ?? "comapny N/A"
    }
    
    public var wrappedIsActive: Bool {
        isActive
    }
    
    
    public var checkIsActive: String {
        return isActive ? "YES" :"NO"
    }
    
    public var wrappedEmail: String {
        email ?? "email N/A"
    }
    
    public var wrappedAge: Int16 {
        age
    }
    
    public var wrappedRegistered: String {
        registered ?? ""
    }
    
    var wrappedTags: String {
        tags ?? ""
    }
    
   
    
    public var cachedFriend: [CachedFriend] {
        let set = friends as? Set<CachedFriend> ?? []
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
        
    }

}

// MARK: Generated accessors for friends
extension CachedUser {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: CachedFriend)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: CachedFriend)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

extension CachedUser : Identifiable {

}
