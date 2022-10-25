//
//  ProductDetailController.swift
//  ProductModule
//
//  Created by Kaan Ozdemir on 24.10.2022.
//

import UIKit
import Kingfisher
import APIClient

public class ProductDetailController: UIViewController {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var product: Product? {
        didSet {
            updateViews()
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        fetchProduct(productId: "1")
    }
    
    func fetchProduct(productId: String) {
        
        APIClient().request(request: .productDetail, response: Product.self) { result in
            switch result {
            case .success(let product):
                self.product = product
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func updateViews() {
        if let imageURL = URL(string: product?.image ?? "") {
            productImageView.kf.setImage(with: ImageResource(downloadURL: imageURL))
        } else {
            productImageView.image = nil
        }
        nameLabel.text = product?.name
        priceLabel.text = product?.price
    }
}
