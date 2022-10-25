//
//  ProductListController.swift
//  ProductModule
//
//  Created by Kaan Ozdemir on 24.10.2022.
//

import UIKit
import APIClient

public class ProductListController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let productCellId = "ProductCell"
    
    var products: [Product] = []
    
    var ratio: CGFloat {
        547 / 821
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: productCellId, bundle: Bundle(for: ProductCell.self)), forCellWithReuseIdentifier: productCellId)
        
        fetchProducts()
    }
    
    func fetchProducts() {
        APIClient().request(request: .productList, response: ProductResponse.self) { result in
            switch result {
            case .success(let response):
                self.products = response.data
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension ProductListController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productCellId, for: indexPath) as! ProductCell
        let product = products[indexPath.item]
        cell.setCell(with: product)
        return cell
    }
}

extension ProductListController: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = ProductDetailController(nibName: "ProductDetailController", bundle:  Bundle(for: ProductDetailController.self))
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension ProductListController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2 - 10
        let productInfoHeight: CGFloat = 60
        let height = width / ratio + productInfoHeight
        return CGSize(width: width, height: height)
    }
}
