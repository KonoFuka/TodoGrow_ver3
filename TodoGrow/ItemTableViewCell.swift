//
//  ItemTableViewCell.swift
//  TodoGrow
//
//  Created by 香野風花 on 2024/01/09.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var markImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(title:String, day:String, isMarked:Bool) {
            titleLabel.text = title
            if isMarked {
                markImageView.image = UIImage(systemName: "circle.fill")
            } else{
                markImageView.image = UIImage(systemName: "circle")
            }
        }
    
}
