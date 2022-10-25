//
//  ProductResponse.swift
//  APIClient
//
//  Created by Kaan Ozdemir on 24.10.2022.
//

import Foundation

public class ProductResponse: Decodable {
    public var success: Bool = false
    public var data: [Product] = []
}

public class Product: Decodable {
    public var image: String?
    public var name: String?
    public var price: String?
}
