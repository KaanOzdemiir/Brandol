//
//  HomeResponse.swift
//  APIClient
//
//  Created by Kaan Ozdemir on 24.10.2022.
//

import Foundation

public class HomeResponse: Decodable {
    public var success: Bool = false
    public var data: [Banner] = []
}

public class Banner: Decodable {
    public var image: String?
    public var title: String?
}
