//
//  HomeController.swift
//  Brandol
//
//  Created by Kaan Ozdemir on 24.10.2022.
//

import UIKit
import APIClient
import Kingfisher

open class HomeController: UIViewController {

    var banners: [Banner] = [] {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var bannerCellId = "BannerCell"
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: bannerCellId, bundle: Bundle(for: BannerCell.self)), forCellReuseIdentifier: bannerCellId)
        
        fetchHomeBanners()
    }
    
    func fetchHomeBanners() {
        APIClient().request(request: .home, response: HomeResponse.self) { result in
            switch result {
            case .success(let response):
                self.banners = response.data
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func updateViews() {
        tableView.reloadData()
    }
}

extension HomeController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        banners.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: bannerCellId, for: indexPath) as! BannerCell
        let banner = banners[indexPath.row]
        cell.setCell(with: banner)
        return cell
    }
}

extension HomeController: UITableViewDelegate {
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
