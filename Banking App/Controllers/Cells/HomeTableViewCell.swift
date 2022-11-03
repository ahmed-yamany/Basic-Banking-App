//
//  HomeTableViewCell.swift
//  Banking App
//
//  Created by Ahmed Yamany on 03/11/2022.
//

import UIKit


class HomeTableViewCell: UITableViewCell {
    static let identifier = "HomeTableViewCell"
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var balance: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userImage.clipsToBounds = true
        userImage.layer.cornerRadius = userImage.frame.height / 3 - 5
    }
    
    func setup(with user: User){
        feachImage(from: user.image)
        name.text = user.name
        balance.text = "Balance is \(user.balance)$"
    }
    
    
    private func feachImage(from url: String){
        Task{
            userImage.image = try await BankManager.shared.fetchImage(from: URL(string: url)!)
        }
    }
    
    
    
}
