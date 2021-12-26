//
//  DetailView.swift
//  FriendFaceCD
//
//  Created by Amit Shrivastava on 23/12/21.
//

import SwiftUI

struct DetailView: View {
   // let users: [CachedUser]
    let user: CachedUser
   
 
    var body: some View {
        Form {
            List {
                Section("Name") {
                    Text(user.wrappedName)
                        .font(.body)
                }
                Section("email") {
                    Text(user.wrappedEmail)
                }
                Section("Registration Date") {
                    Text(user.wrappedEmail)
                }
                Section("Company") {
                    Text(user.wrappedCompany)
                }
                Section("Is Active") {
                    Image(systemName: user.isActive ? "checkmark.circle.fill" : "xmark.octagon.fill")
                        .foregroundColor(user.isActive ? Color.green : Color.red)
                }
                
                Section("Friends") {
                   
                    ForEach(user.cachedFriend, id:\.self) {  friend  in
                        Text(friend.wrappedName)
                    }
               
                        
                    }
                  
                    
                }
           
                               
                
            }
         
           
            
           
            }
           
          
        }
        
 


//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(users: <#T##[CachedUser]#>, user: <#T##CachedUser#>)
//    }
//}
