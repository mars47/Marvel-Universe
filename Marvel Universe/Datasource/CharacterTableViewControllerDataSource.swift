//
//  CharacterTableViewControllerDataSource.swift
//  Marvel Universe
//
//  Created by Omar  on 15/05/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit

class CharacterTableViewControllerDataSource: NSObject, UITableViewDataSource {
    
//    let viewModel: ViewControllerViewModel
//
//    init(viewModel :ViewControllerViewModel){
//        self.viewModel = viewModel
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return viewModel.fruitCells.value.count
                print("function has been called")
       return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "infoTableViewCell", for: indexPath) as? infoTableViewCell {
//            
//            cell.viewModel = InfoTableViewCellViewModel(label: self.viewModel.fruitCells.value[indexPath.row].type)
//            return cell
//        }
//        return UITableViewCell()

        return UITableViewCell()
    }
    
}
