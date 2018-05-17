//
//  CharacterCollectionViewCell.swift
//  Marvel Universe
//
//  Created by Omar  on 16/05/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterLabel: UILabel!
    
    
    var viewModel: CharacterCollectionViewCellViewModel! {
        didSet {
            bind()
        }
    }

    func bind() {
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 0.5

        
        DispatchQueue.main.async {
            //self.charachterLabel.text = viewModel.nameLabel.value
            
            self.characterImage.image = self.viewModel.image
            self.characterImage.contentMode = .scaleAspectFill
            self.characterImage.clipsToBounds = true
        }

    }

    func assignViewModel(viewModel: CharacterCollectionViewCellViewModel) {
        self.viewModel = viewModel
    }
}
