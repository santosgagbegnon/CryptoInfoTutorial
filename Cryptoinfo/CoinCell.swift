//
//  CoinCell.swift
//  Cryptoinfo
//
//  Created by Santos on 2019-02-23.
//  Copyright © 2019 Santos.swift. All rights reserved.
//

import UIKit

class CoinCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var priceUSD: UILabel!
    
    override func layoutSubviews() {
        //Styling the cell
        layer.cornerRadius = 6
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
    }
    
}
