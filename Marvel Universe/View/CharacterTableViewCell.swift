//
//  CharacterTableViewCell.swift
//  Marvel Universe
//
//  Created by Omar  on 16/05/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit


class CharacterTableViewCell : UITableViewCell {
    
    @IBOutlet weak var characterImage: UIImageView!
    
    @IBOutlet weak var characterName: UILabel!
    func bind() {
       // typeLabel.text = viewModel.nameLabel.value
    }
}
