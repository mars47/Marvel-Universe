//
//  CharacterCollectionViewCellViewModel.swift
//  Marvel Universe
//
//  Created by Omar  on 17/05/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import Foundation
import UIKit

class CharacterCollectionViewCellViewModel: NSObject {
    
    let character: Character
    let appServerClient: AppServerClient
    var image: UIImage!
    var thumbnailUrl = URL(string: "")

    init(initWith character: Character, appServerClient: AppServerClient = AppServerClient() ){
        self.appServerClient = appServerClient
        self.character = character
        super.init()
        
        thumbnailUrl = URL(string: character.thumbnailUrl)
        setupThumbnailImage(url: thumbnailUrl!)
    }
    
    func setupThumbnailImage(url: URL) {

        appServerClient.loadImageUsingUrlString(url: url) { (result) in
            
            switch result {
            case .success(let value):
                let image = value as! UIImage
                self.image = image
                
                
            case .failure(let error):
                print("error: \(error)")
            }
        }
    }
    
}
