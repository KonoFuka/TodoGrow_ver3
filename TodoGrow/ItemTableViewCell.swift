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
    @IBOutlet var markLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    //セルの中身のセット
    func setCell(title:String, day:String, isMarked:Bool, isdone:Bool) {
        titleLabel.text = title
        dayLabel.text = day
        if isdone {
            markLabel.text = "●"
            titleLabel.textColor = UIColor.gray
            markLabel.textColor = UIColor.gray
            
        } else{
            markLabel.text = "○"
            if isMarked {
                titleLabel.textColor = UIColor(red: 91/255, green: 104/255, blue: 72/255, alpha: 1.0)
                markLabel.textColor = UIColor(red: 91/255, green: 104/255, blue: 72/255, alpha: 1.0)
            } else{
                titleLabel.textColor = UIColor(red: 132/255, green: 189/255, blue: 127/255, alpha: 1.0)
                markLabel.textColor = UIColor(red: 132/255, green: 189/255, blue: 127/255, alpha: 1.0)
            }
        }
        
    }
    
}
