//
//  Item.swift
//  Todoey
//
//  Created by Renat Sadretdinov on 24/09/2018.
//  Copyright © 2018 Renat Sadretdinov. All rights reserved.
//

import Foundation

// For the class that is Codable all its members must be of the standard data types
// Codable is a combination of a protocol of Encodable and a protocol of Decodable 
class Item: Codable {
    var title: String = ""
    var done: Bool = false
}
