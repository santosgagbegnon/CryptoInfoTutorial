//
//  ViewController.swift
//  Cryptoinfo
//
//  Created by Santos on 2019-02-23.
//  Copyright © 2019 Santos.swift. All rights reserved.
//

import UIKit

class CryptoInfoCollectionVC: UICollectionViewController {
    var currencies : [Any] = []
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.fetchCoins { (coins) in
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let coinHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CoinHeader", for: indexPath)
        return coinHeader
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let coinCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoinCell", for: indexPath) as? CoinCell{
            return coinCell
        }
        else{
            fatalError("Error finding Coin Cell")
        }
    }
    
}

