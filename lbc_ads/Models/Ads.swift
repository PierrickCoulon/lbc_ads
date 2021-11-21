//
//  Ads.swift
//  lbc_ads
//
//  Created by Pierrick Coulon - Safeware on 21/11/2021.
//

import Foundation


struct Ads: Codable {
    var id: Int64?
    var category_id: Int64?
    var title: String?
    var description: String?
    var price: Float?
    var images_url: ImagesURL?
    var creation_date: String?
    var is_urgent: Bool?
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case category_id = "category_id"
        case title = "title"
        case description = "description"
        case price = "price"
        case images_url = "images_url"
        case creation_date = "creation_date"
        case is_urgent = "is_urgent"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(Int64.self, forKey: .id)
        category_id = try values.decode(Int64.self, forKey: .category_id)
        title = try values.decode(String.self, forKey: .title)
        description = try values.decode(String.self, forKey: .description)
        price = try values.decode(Float.self, forKey: .price)
        images_url = try values.decode(ImagesURL.self, forKey: .images_url)
        creation_date = try values.decode(String.self, forKey: .creation_date)
        is_urgent = try values.decode(Bool.self, forKey: .is_urgent)
    }
    
}
