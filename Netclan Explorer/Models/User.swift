//
//  User.swift
//  Netclan Explorer
//
//  Created by Tamuna Kakhidze on 17.08.24.
//

import Foundation

struct User: Identifiable, Decodable {
    var id: Int
    var name: String
    var location: String
    var distance: Double
    var status: String
    var purposes: [Purpose] = []
    var usertype: Segment
    var profession: String = ""
    var experience: String = ""
    var service: String = ""
}
