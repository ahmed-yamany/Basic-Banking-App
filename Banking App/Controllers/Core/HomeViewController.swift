//
//  HomeViewController.swift
//  Banking App
//
//  Created by Ahmed Yamany on 03/11/2022.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - SubViews
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: HomeTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: HomeTableViewCell.identifier)
        return tableView
    }()
    
    
    // MARK: - VC life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All Users"
        self.addSubViews()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    // MARK: - Private Funcs
    private func addSubViews(){
        view.addSubview(tableView)
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BankManager.shared.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else{return UITableViewCell()}
        let user = BankManager.shared.users[indexPath.row]
        cell.setup(with: user)
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
