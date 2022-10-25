//
//  ProductCell.swift
//  ProductModule
//
//  Created by Kaan Ozdemir on 24.10.2022.
//

import UIKit
import APIClient
import Kingfisher

class ProductCell: UICollectionViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCell(with model: Product) {
        if let imageURL = URL(string: model.image ?? "") {
            productImageView.kf.setImage(with: ImageResource(downloadURL: imageURL))
        } else {
            productImageView.image = nil
        }
        
        productNameLabel.text = model.name
        priceLabel.text = model.price
    }
}
