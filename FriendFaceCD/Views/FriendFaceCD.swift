//
//  ContentView.swift
//  FriendFaceCD
//
//  Created by Amit Shrivastava on 23/12/21.
//

//import SwiftUI
//import CoreData
//
//struct FriendFaceCD: View {
//    @Environment(\.managedObjectContext) var moc
//    @State private var results = [User]()
//    @FetchRequest(sortDescriptors: []) var users: FetchedResults<CachedUser>
//    @State private var cachedUser = [CachedUser]()
//    var body: some View {
//
//        NavigationView {
//            List {
//                ForEach(users, id:\.id) {
//                    item in
//                    NavigationLink(destination: DetailView(users: cachedUser, user: item)) {
//                        HStack(spacing: 20) {
//                        Text(item.wrappedName)
//                            Image(systemName: item.isActive ? "checkmark.circle.fill" : "xmark.octagon.fill")
//                                .foregroundColor(item.isActive ? Color.green : Color.red)
//                        }
//                    }
//
//                }
//            }
//            .navigationTitle("Friend Face")
//            .task {
//                await loadData()
//            }
//
//        }
//        .onAppear {
//
//                  for result in results {
//                      let userData = CachedUser(context: moc)
//                      userData.id = result.id
//                      userData.isActive = result.isActive
//                      userData.name = result.name
//                      userData.age = Int16(result.age)
//                      userData.company = result.company
//                      userData.email = result.email
//                      userData.address = result.address
//                      userData.about = result.about
//                      userData.registered = result.dateFormatString
//                      try? moc.save()
//                  }
//
//                  for i in 0 ..< results.count {
//                      for friend in results[i].friends {
//                          let friendData = CachedFriend(context: moc)
//                          friendData.name = friend.name
//                          friendData.id = friend.id
//                          try? moc.save()
//                      }
//                  }
//        }
//    }
//
//    func loadData() async {
//        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
//            print("no data found")
//            return
//        }
//
//        let jdecoder = JSONDecoder()
//        jdecoder.dateDecodingStrategy = .iso8601
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            if let decodedData = try? jdecoder.decode([User].self, from: data) {
//                results = decodedData
//            }
//        }
//
//        catch {
//            print("fatal error")
//        }
//
//
//
//    }
//
//}
//
//struct FriendFaceCD_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendFaceCD()
//    }
//}



import SwiftUI
import CoreData

struct FriendFaceCD: View {
    @Environment(\.managedObjectContext) var moc
    @State private var results: [User] = []
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<CachedUser>
    
    
   // @State private var cachedUser = [CachedUser]()
   // @State private var cachedFriends = [CachedFriend]()
   
    
  
    var body: some View {
        
       NavigationView {
            List {
              ForEach(users, id:\.id) {
                    item in
                    NavigationLink(destination: DetailView(user: item)) {
                        HStack(spacing: 20) {
                            Text(item.wrappedName)
                            Image(systemName: item.isActive ? "checkmark.circle.fill" : "xmark.octagon.fill")
                                .foregroundColor(item.isActive ? Color.green : Color.red)
                        }
                    }
                    
                }
            }
            .navigationTitle("Friend Face")
          
            .task {

             await loadData()


            }
            
        }
        
    }
    
    
    
    func loadData() async  {
        
        guard  results.isEmpty else { return }
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("no data found")
            return
        }
        
        let jdecoder = JSONDecoder()
        jdecoder.dateDecodingStrategy = .iso8601
        do {
           let (data, _) = try await URLSession.shared.data(from: url)
           
            if let decodedData = try? jdecoder.decode([User].self, from: data) {
                results = decodedData
                await MainActor.run {
                    userCoreData(with: results)
                }
            }
        }
        
        catch {
            print("fatal error")
        }
 
    }
    
    
    func userCoreData(with downloadedUser: [User]) {
       
        for result in downloadedUser {
            let userData = CachedUser(context: moc)
            userData.id = result.id
            userData.isActive = result.isActive
            userData.name = result.name
            userData.age = Int16(result.age)
            userData.company = result.company
            userData.email = result.email
            userData.address = result.address
            userData.about = result.about
            userData.registered = result.dateFormatString
            userData.tags = result.tags.joined(separator: ",")
          
        
        
   
            
            for friend in result.friends {
                let friendData = CachedFriend(context: moc)
                friendData.name = friend.name
                friendData.id = friend.id
                userData.addToFriends(friendData)
                
            }
     
        }
      
        try? moc.save()
       
    }
    
    
}

struct FriendFaceCD_Previews: PreviewProvider {
    static var previews: some View {
        FriendFaceCD()
    }
}
