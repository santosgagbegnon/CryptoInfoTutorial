//
//  NetworkManager.swift
//  Cryptoinfo
//
//  Created by Santos on 2019-02-23.
//  Copyright © 2019 Santos.swift. All rights reserved.
//

import Foundation
class NetworkManager {
    
    static var shared : NetworkManager = {
        return NetworkManager()
    }()
    private init(){}
    
    
    /// Fetches the first 100 coins from the CoinLore crypto currency API
    ///
    /// - Parameter completionHandler: method to be called once method is compelted
    public func fetchCoins(completionHandler : @escaping (CIResponse?) -> Void){
        guard let url = URL(string:"https://api.coinlore.com/api/tickers/") else {fatalError("CoinLore URL is Invalid")}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if(error != nil){
                print("Error fetching coins \(error!.localizedDescription)")
                completionHandler(nil)
            }

            guard let httpResponse = response as? HTTPURLResponse else {fatalError("Response cannot be converted to a HTTP URL Response")}
            
            switch httpResponse.statusCode {
                
            case 200:
                if let coinData = data {
                    print("Everything is good to go \(coinData)")
                }
                break
            default:
               completionHandler(nil)
                break
                
            }
            
            
        }.resume()
    }
}
