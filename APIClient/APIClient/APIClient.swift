//
//  APIClient.swift
//  APIClient
//
//  Created by Kaan Ozdemir on 24.10.2022.
//

import Foundation

public enum Request: String {
    case home = "HomeResponse"
    case productList = "ProductListResponse"
    case productDetail = "Product"
}

public typealias APIClientResult<T> = (Result<T, Error>) -> Void

protocol APIClientProtocol {
    func request<Response: Decodable>(request: Request, response: Response.Type, result: APIClientResult<Response>?)
}

public class APIClient: APIClientProtocol {
    
    public init() { }
    
    public func request<Response>(request: Request, response: Response.Type, result: APIClientResult<Response>?) where Response : Decodable {
        let bundle = Bundle(for: type(of: self))
        do {
            guard
                let path = bundle.path(forResource: request.rawValue, ofType: "json")
            else {
                throw NSError(domain: "DataProvider", code: 0, userInfo: [NSLocalizedDescriptionKey: "The json file not be found."])
            }
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let decoder = JSONDecoder()
            decoder.dataDecodingStrategy = .deferredToData
            let response = try decoder.decode(response, from: data)
            result?(.success(response))
        } catch {
            result?(.failure(error))
        }
    }
}
