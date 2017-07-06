//
//  RestaurantCell.swift
//  MoyaExample
//
//  Created by SVYAT on 06.07.17.
//  Copyright © 2017 HiT2B. All rights reserved.
//

import UIKit

class RestaurantCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var address: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(_ restaurant: Restaurant) {
        self.title.text = restaurant.title ?? "No title"
        self.address.text = restaurant.address ?? "no cuisine"
    }
}
