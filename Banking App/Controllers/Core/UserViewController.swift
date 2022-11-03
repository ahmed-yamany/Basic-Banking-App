//
//  UserViewController.swift
//  Banking App
//
//  Created by Ahmed Yamany on 03/11/2022.
//

import UIKit

class UserViewController: UIViewController {
    // MARK: - Properties
    var user: User?
    
    // MARK: - Subviews
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var transeferButton: UIButton!
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

    }
    
    private func updateUI(){
        image.layer.cornerRadius = image.frame.height / 2
        guard let user = user else{return}
        feachImage(from: user.image)
        name.text = user.name
        balance.text = "\(user.balance)$"
        email.text = user.email
    }
    private func feachImage(from url: String){
        Task{
            image.image = try await BankManager.shared.fetchImage(from: URL(string: url)!)
        }
    }


}
