//
//  Character.swift
//  Marvel Universe
//
//  Created by Omar  on 16/05/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import Foundation

class Character: NSObject {
    
    private (set) var name: String
    private (set) var descriptionMessage: String
    private (set) var detailUrl: String
    private (set) var thumbnailUrl: String
    
    init(initialiseCharacterWith dictionary:Dictionary<String, Any>) {
        
        self.name = dictionary["name"] as! String
        self.descriptionMessage = dictionary["description"] as! String
        
        let thumbnailDictionary =  dictionary["thumbnail"] as! Dictionary<String, String>
        self.thumbnailUrl = thumbnailDictionary["path"]! + "." + thumbnailDictionary["extension"]!
        
        var urlArray = dictionary["urls"] as! [Dictionary<String, String>]
        let urlDetail =  urlArray[0]
        self.detailUrl = urlDetail["url"]! as String
        
    }
    
}



