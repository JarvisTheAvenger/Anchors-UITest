//
//  UserTableViewCell.swift
//  Anchors
//
//  Created by Rahul on 08/05/21.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var userAvatarImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(_ user: User) {
        userNameLabel.text = user.name
        cityNameLabel.text = user.city
    }
    
}
