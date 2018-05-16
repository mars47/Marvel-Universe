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

}
