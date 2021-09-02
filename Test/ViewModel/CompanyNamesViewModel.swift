//
//  CompanyNamesViewModel.swift
//  Test
//
//  Created by iMac on 01/09/21.
//

import Foundation
import UIKit

class CompanyNamesViewModel : NSObject {
    var content = [NamesModel]()
    var bindDataToViewController : (() -> ()) = {}
    var filteredCompaniesArray =  [[String : String]]()
    func addData() {
        //        image1 => names , image
        let dic1 = ["slideshowImage" : UIImage.init(named: "image_0")!,
                    "companyInfo" : [["name" : "Reliance","icon" : "logo_1"],
                                     ["name" : "State Bank of India","icon" : "logo_2"],
                                     ["name" : "Oil & Natural Gas","icon" : "logo_3"],
                                     ["name" : "HDFC Bank","icon" : "logo_4"],
                                     ["name" : "Indian Oil","icon" : "logo_1"],
                                     ["name" : "Tata Motors","icon" : "logo_2"],
                                     ["name" : "ICICI Bank","icon" : "logo_3"],
                                     ["name" : "Thomson","icon" : "logo_4"],
                                     ["name" : "HDFC","icon" : "logo_1"],
                                     ["name" : "NTPC","icon" : "logo_2"],
                                     ["name" : "Axis Bank","icon" : "logo_3"],
                                     ["name" : "Larsen & Toubro","icon" : "logo_4"],
                                     ["name" : "Bharti Airtel","icon" : "logo_1"],
                                     ["name" : "Coal India","icon" : "logo_2"],
                                     ["name" : "Bharat Petroleum","icon" : "logo_3"],
                                     ["name" : "Kotak Mahindra Bank","icon" : "logo_4"],
                                     ["name" : "ITC","icon" : "logo_1"],
                                     ["name" : "Hindustan Petroleum","icon" : "logo_2"],
                                     ["name" : "Power Grid of India","icon" : "logo_3"],
                                     ["name" : "Mahindra & Mahindra","icon" : "logo_4"],
                                     ["name" : "HCL Technologies","icon" : "logo_1"],
                                     ["name" : "Sun Pharma Industries","icon" : "logo_2"],
                                     ["name" : "Tata Steel","icon" : "logo_3"],
                                     ["name" : "Power Finance","icon" : "logo_4"],
                    ]] as [String : Any]
        
        
        
        
        
        content.append(NamesModel.init(dic: dic1))
        
        let dic2 = ["slideshowImage" : UIImage.init(named: "image_1")!,
                    "companyInfo" : [["name" : "Adani Ports and Special Economic Zone","icon" : "logo_1"],
                                     ["name" : "Ajanta Pharma","icon" : "logo_2"],
                                     ["name" : "Alembic Pharmaceuticals","icon" : "logo_3"],
                                     ["name" : "Amara Raja Batteries","icon" : "logo_4"],
                                     ["name" : "Ashok","icon" : "logo_1"],
                                     ["name" : "Asian","icon" : "logo_2"],
                                     ["name" : "Aurobindo","icon" : "logo_3"],
                                     ["name" : "Bajaj","icon" : "logo_4"],
                                     ["name" : "Berger","icon" : "logo_1"],
                                     ["name" : "Bharat","icon" : "logo_2"],
                                     ["name" : "Britannia","icon" : "logo_3"],
                                     ["name" : "Cadila","icon" : "logo_4"],
                                     ["name" : "Crisil","icon" : "logo_1"],
                                     ["name" : "Cholamandalam","icon" : "logo_2"],
                                     ["name" : "Dewan","icon" : "logo_3"],
                                     ["name" : "Hindustan Petroleum","icon" : "logo_4"],
                                     ["name" : "Power Grid of India","icon" : "logo_1"],
                                     ["name" : "Mahindra & Mahindra","icon" : "logo_2"],
                                     ["name" : "HCL Technologies","icon" : "logo_3"],
                                     ["name" : "Sun Pharma Industries","icon" : "logo_4"],
                                     ["name" : "Tata Steel","icon" : "logo_1"],
                                     ["name" : "Power Finance","icon" : "logo_2"]]] as [String : Any]
        
        
        content.append(NamesModel.init(dic: dic2))
        
        let dic3 = ["slideshowImage" : UIImage.init(named: "image_2")!,
                    "companyInfo" : [["name" : "UPL","icon" : "logo_1"],
                                     ["name" : "Vakrangee","icon" : "logo_2"],
                                     ["name" : "Wabco","icon" : "logo_3"],
                                     ["name" : "Whirlpool","icon" : "logo_4"],
                                     ["name" : "Yes","icon" : "logo_1"],
                                     ["name" : "Zee","icon" : "logo_2"],
                                     ["name" : "Manpasand","icon" : "logo_3"],
                                     ["name" : "Software","icon" : "logo_4"],
                                     ["name" : "Solutions","icon" : "logo_1"],
                                     ["name" : "IndusInd","icon" : "logo_2"],
                                     ["name" : "Motherson","icon" : "logo_3"],
                                     ["name" : "Rajesh","icon" : "logo_4"],
                                     ["name" : "Yes","icon" : "logo_1"],
                                     ["name" : "Kellton","icon" : "logo_2"],
                                     ["name" : "Cement","icon" : "logo_3"],
                                     ["name" : "Hindustan Petroleum","icon" : "logo_4"],
                                     ["name" : "Power Grid of India","icon" : "logo_1"],
                                     ["name" : "Mahindra & Mahindra","icon" : "logo_2"],
                                     ["name" : "HCL Technologies","icon" : "logo_3"],
                                     ["name" : "Sun Pharma Industries","icon" : "logo_4"],
                                     ["name" : "Tata Steel","icon" : "logo_1"],
                                     ["name" : "Power Finance","icon" : "logo_2"]]] as [String : Any]
        
        content.append(NamesModel.init(dic: dic3))
        self.bindDataToViewController()
    }
    
    override init() {
        super.init()
    }
    
}
