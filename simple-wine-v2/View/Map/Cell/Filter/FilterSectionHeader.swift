//
//  FilterSectionHeader.swift
//  simple-wine-v2
//
//  Created by Igor Ivanov on 01.02.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import UIKit

class FilterSectionHeader: UITableViewHeaderFooterView {

    @IBOutlet weak var title: UILabel!
    
    static let reuseIdentifier: String = String(describing: self)

    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
 
}
