//
//  Purpose.swift
//  Netclan Explorer
//
//  Created by Tamuna Kakhidze on 17.08.24.
//

import Foundation

struct Purpose: Identifiable, Decodable {
    var id: Int
    var text: String
    var isSelected: Bool = false
}
