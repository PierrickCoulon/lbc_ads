//
//  Categories.swift
//  lbc_ads
//
//  Created by Pierrick Coulon - Safeware on 21/11/2021.
//

import Foundation


struct Categories: Codable {
    var id: Int?
    var name: String?
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
    }
    
}
