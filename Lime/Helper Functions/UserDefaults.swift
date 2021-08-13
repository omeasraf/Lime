//
//  UserDefaults.swift
//  UserDefaults
//
//  Created by Ome Asraf on 8/12/21.
//

import Foundation
import SwiftUI

extension GlobalEnvironment{
    func saveUserDefaults(loggedIn: Bool) {
        do {
        let encoder = JSONEncoder()
        let data = try encoder.encode(currentUser)
        
        let dataDict: [String: Any?] = [
            "isLoggedIn": loggedIn,
            "last_user": data
        ]
        let saveDefaults = UserDefaults.standard
        do {
            let sessionData = try NSKeyedArchiver.archivedData(withRootObject: dataDict, requiringSecureCoding: false)
            saveDefaults.set(sessionData, forKey: "lastLogin_objects")
            print("Successfully saved data...")
        }
        catch {
            print("Unable to store data")
        }
        }
        catch{
            print("Unable to encode current user")
        }
    }
    
    func getUserLogin(){
        if let lastLogin = UserDefaults.standard.object(forKey: "lastLogin_objects") as? Data{
            do {
                if let session = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(lastLogin) as? [String:Any?] {
                    print(session)
                    if let loginStatus = session["isLoggedIn"] as? Bool, let lastUser = session["last_user"] as? Data{
                        do {
                            let decoder = JSONDecoder()
                            let data = try decoder.decode(User.self, from: lastUser) as User
                            isLoggedIn = loginStatus
                            currentUser = data
                        }
                        catch {
                            print("Unable to decode encoded user data")
                        }
                        
                    }
                    print(session)
                    print("Logged In Successfully")
                }
            }
            catch {
                print("Something went wrong")
            }
        }
        else{
            print("Unable to unwrap userdefaults data")
        }
    }
}
