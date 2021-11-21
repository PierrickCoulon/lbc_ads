//
//  ImagesURL.swift
//  lbc_ads
//
//  Created by Pierrick Coulon - Safeware on 21/11/2021.
//

import Foundation

struct ImagesURL: Codable {
    var small: String?
    var thumb: String?
    
    private enum CodingKeys: String, CodingKey {
        case small = "small"
        case thumb = "thumb"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        small = try? values.decode(String.self, forKey: .small)
        thumb = try? values.decode(String.self, forKey: .thumb)
    }
    
}
