//
//  LbcAPI.swift
//  lbc_ads
//
//  Created by Pierrick Coulon - Safeware on 21/11/2021.
//

import Foundation


struct LbcAPI {
    
    let baseUrl = URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/")
    
    public func fetchAds(completion: (([Ads]?, Error?) -> Void)?) {
        guard let request = NetworkManager.shared.createRequest(for: baseUrl?.appendingPathComponent("listing.json"), httpMethod: .GET) else {
            completion?(nil, NetworkError.invalidUrl)
            return
        }
        NetworkManager.shared.executeRequest(request: request, completion: completion)
    }
    
    public func fetchCategories(completion: (([Categories]?, Error?) -> Void)?) {
        guard let request = NetworkManager.shared.createRequest(for: baseUrl?.appendingPathComponent("categories.json"), httpMethod: .GET) else {
            completion?(nil, NetworkError.invalidUrl)
            return
        }
        NetworkManager.shared.executeRequest(request: request, completion: completion)
    }
}
