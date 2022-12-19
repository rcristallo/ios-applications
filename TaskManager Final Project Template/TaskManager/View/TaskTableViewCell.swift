//
//  TaskTableViewCell.swift
//  TaskManager
//
//  Created by Raffaele Cristallo on 2022-12-02
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    static let identifier = "TaskTableViewCell"
    
    @IBOutlet var lblTask : UILabel!
    @IBOutlet var lblNameCreatedBy : UILabel!
    @IBOutlet var imgViewTaskDone : UIImageView!
    
    func setContent( task : TaskModel ){
        lblTask.text = task.description
        lblNameCreatedBy.text = task.createdByName.uppercased()
        
        if task.done {
            imgViewTaskDone.image = UIImage(systemName: "checkmark")
            imgViewTaskDone.tintColor = UIColor.systemGreen
        } else {
            imgViewTaskDone.image = .init(systemName: "xmark")
            imgViewTaskDone.tintColor = UIColor.systemRed
        }
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
