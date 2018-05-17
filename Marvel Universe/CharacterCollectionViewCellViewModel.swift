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
    
    let appServerClient: AppServerClient
    var image: UIImage!
    var thumbnailUrl = URL(string: "")

    init(initWith character: Character, appServerClient: AppServerClient = AppServerClient() ){
        self.appServerClient = appServerClient
        super.init()
        
        thumbnailUrl = URL(string: character.thumbnailUrl)
        setupThumbnailImage(url: thumbnailUrl!, string: character.thumbnailUrl)
    }
    
    func setupThumbnailImage(url: URL, string: String) {

        appServerClient.loadImageUsingUrlString(url: url, urlString: string) { (result) in
            
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
