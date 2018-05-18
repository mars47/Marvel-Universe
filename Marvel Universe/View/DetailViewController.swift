//
//  DetailViewController.swift
//  Marvel Universe
//
//  Created by Omar  on 18/05/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var viewModel : CharacterCollectionViewCellViewModel!

    @IBOutlet weak var titleNavigationItem: UINavigationItem!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleNavigationItem.title = viewModel.character.name
        characterImageView.image = viewModel.image
        characterImageView.contentMode = .scaleAspectFill
        characterImageView.clipsToBounds = true
        textView.text = checkDescription(text: viewModel.character.descriptionMessage)
    }
    
    @IBAction func detailsButtonPressed(_ sender: Any) {
        guard let url = URL(string: viewModel.character.detailUrl) else { return }
         UIApplication.shared.open(url as URL, options: [:])
    }
    
    func checkDescription(text: String) -> String {
        if text == "" { return "There is no description for this character" }
        else { return text }
    }
}
