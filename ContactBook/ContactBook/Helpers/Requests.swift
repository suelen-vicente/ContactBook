//
//  Requests.swift
//  ContactBook
//
//  Created by Suelen Vicente on 2022-04-20.
//

import Foundation

class Requests{
    static func getContacts(completionHandler: @escaping (_ contacts: [Contact]) -> Void) {
        guard let contactsUrl = URL(string: "https://reqres.in/api/users") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: contactsUrl) { data, response, error in
            guard error == nil else { return }
            guard let data = data else { return }
            
            let dictionary = try? JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            
            var contacts: [Contact] = []
            
            var i = 0
            
            let dataDictionary = dictionary?["data"] as! NSArray
            
            while(i < dataDictionary.count){
                let contactValue = dataDictionary[i] as! NSDictionary
                let contact = Contact(id: contactValue["id"] as! Int,
                                      email: contactValue["email"] as! String,
                                      firstName: contactValue["first_name"] as! String,
                                      lastName: contactValue["last_name"] as! String,
                                      avatar: contactValue["avatar"] as! String)
                
                contacts.append(contact)
                
                i += 1
            }
            
            completionHandler(contacts)
        }
        
        task.resume()
    }
}
