//
//  CharacterCollectionViewControllerViewModel.swift
//  Marvel Universe
//
//  Created by Omar  on 16/05/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import Foundation

class CharacterCollectionViewControllerViewModel: NSObject {
    
    let characterArray = Bindable([Character]())
    let url = URL(string: "https://bit.ly/2IqWEVY")
    var viewCellViewModelsArray: [CharacterCollectionViewCellViewModel]!
    let appServerClient : AppServerClient
    
    init(appServerClient: AppServerClient = AppServerClient()) {
        self.appServerClient = appServerClient
    }
    
    func getCharacterList() {
        appServerClient.getCharacterList(from: url!) { (result) in
        
            switch result {
            case .success(let value):
                self.characterArray.value  = value as! [Character]
                
                //Creates an array that stores all the CharacterCollectionViewCellViewModels
                self.viewCellViewModelsArray = self.characterArray.value.flatMap { CharacterCollectionViewCellViewModel(initWith: $0) }
                
            case .failure(let error):
                print("error: \(error)")
            }
            
            // Using the MVVM pattern means theres no need to cache the downloaded thumbnail images. Each downloaded UIImage is stored inside its relevant view model, ensuring only one web request is made for each thumbnail.
        }
    }

}
