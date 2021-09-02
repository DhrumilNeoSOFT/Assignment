//
//  NamesTVCell.swift
//  Test
//
//  Created by iMac on 31/08/21.
//

import UIKit

class NamesTVCell: UITableViewCell {

    static let identifier = "NamesTVCell"
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(companyInfo : [String:String]) {
        lblName.text = companyInfo["name"]
        imgView.image = UIImage.init(named: companyInfo["icon"]!)
    }
    
}
