//
//  UserTableViewCell.swift
//  TaskManager
//
//  Created by Raffaele Cristallo on 2022-12-02.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    static let identifier = "UserTableViewCell"
    
    @IBOutlet var lblUserName : UILabel!
    @IBOutlet var lblUserEmail : UILabel!
    @IBOutlet var imgViewStar : UIImageView!
    
    func setContent( user : UserModel ){
        lblUserName.text = user.name.capitalized
        lblUserEmail.text = user.email.uppercased()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
