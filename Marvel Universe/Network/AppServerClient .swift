//
//  AppServerClient .swift
//  Marvel Universe
//
//  Created by Omar  on 16/05/2018.
//  Copyright © 2018 Omar. All rights reserved.
//
import UIKit
import Foundation

class AppServerClient: NSObject {
   
    func getCharacterList(from url: URL, completion: @escaping (Result<Any>) -> ()) {
        
        var characterArray = [Character]()
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                
                do {
                    let root = try JSONSerialization.jsonObject(with: data, options: []) as! Dictionary<String, Any>
                    let data = root["data"] as! Dictionary<String, Any>
                    let results = data["results"] as! [Dictionary<String, Any>]

                    // 'results.flatMap' returns an array of initialised 'Character' Objects 
                    characterArray = results.flatMap { Character(initialiseCharacterWith: $0 ) }
                    completion(.success(characterArray))
                    print("COUNT: \(characterArray.count) ")
                } catch {
                    print(error)
                    completion(.failure(error))
                }
            }
            
            if let error = error {
                    completion(.failure(error))
            }
        }
        session.resume()
    }
    
    
    func loadImageUsingUrlString(url: URL, urlString: String, completion: @escaping (Result<Any>) -> ()){

        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let image = UIImage(data: data)
                completion(.success(image!))
            }
            
            if let error = error {
                print("ERROR: \(error)")
            }
        }
        session.resume()
    }
}
