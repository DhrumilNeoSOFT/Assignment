//
//  NamesModel.swift
//  Test
//
//  Created by iMac on 01/09/21.
//

import Foundation
import UIKit

class NamesModel : NSObject{
    var image : UIImage?
    var companyInfoDic : [[String : String]]?
    
    init(dic : [String:Any]) {
        image = dic["slideshowImage"] as? UIImage
        companyInfoDic = dic["companyInfo"] as? [[String : String]]
    }
}
