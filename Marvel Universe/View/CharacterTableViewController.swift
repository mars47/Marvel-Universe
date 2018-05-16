//
//  CharacterTableViewController.swift
//  Marvel Universe
//
//  Created by Omar  on 15/05/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit

class CharacterTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let client = AppServerClient()
        let url = URL(string: "http://gateway.marvel.com/v1/public/characters?ts=1&apikey=ff3d4847092294acc724123682af904b&hash=412b0d63f1d175474216fadfcc4e4fed&limit=25&orderBy=-modified")
        
        client.getCharacterList(from: url!) { result in
            switch result {
            case .success(var value):
               let a  = value as! [Character]
               
               for element in a {
                print("\n\n[CHARACTER]\nNAME:\t\t\(element.name)\nDESCRIPTION:\t\(element.descriptionMessage)\nDETAIL URL:\t\(element.detailUrl)\nIMAGE URL:\t\(element.thumbnailUrl)")
                }
            case.failure(let error):
                print("error: \(error)")
                
            }
        }

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! CharacterTableViewCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }


}
