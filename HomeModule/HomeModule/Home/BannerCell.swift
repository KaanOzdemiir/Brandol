//
//  BannerCell.swift
//  Brandol
//
//  Created by Kaan Ozdemir on 24.10.2022.
//

import UIKit
import APIClient
import Kingfisher

public class BannerCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bannerImageView: UIImageView!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setCell(with model: Banner) {
        titleLabel.text = model.title
        if let imageURL = URL(string: model.image ?? "") {
            bannerImageView.kf.setImage(with: ImageResource(downloadURL: imageURL))
        } else {
            bannerImageView.image = nil
        }
    }
}
