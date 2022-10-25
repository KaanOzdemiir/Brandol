//
//  HomeController+Extensions.swift
//  Brandol
//
//  Created by Kaan Ozdemir on 25.10.2022.
//

import UIKit
import HomeModule
import ProductModule

class BrandolHomeController: HomeController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = ProductListController(nibName: "ProductListController", bundle: Bundle(identifier: "com.ko.ProductModule"))
        navigationController?.pushViewController(controller, animated: true)
    }
}
