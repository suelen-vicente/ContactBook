//
//  Contact.swift
//  ContactBook
//
//  Created by Suelen Vicente on 2022-04-20.
//

import Foundation

struct Contact:Codable{
    public var id: Int
    public var email: String
    public var firstName: String
    public var lastName: String
    public var avatar: String
}
