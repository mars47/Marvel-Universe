//
//  CharacterCollectionViewController.swift
//  Marvel Universe
//
//  Created by Omar  on 16/05/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit

class CharacterCollectionViewController: UICollectionViewController {
    
    let viewModel = CharacterCollectionViewControllerViewModel()
    let appServerClient = AppServerClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Designs the layout of the CollectionView
        setLayout()
        
        // The trailing closure of this method is assigned to a property of 'characterArray'. The assigned closure is always executed after a change to 'characterArray' has been observed
        bindViewModel()
        
        //Downloads data to device - and populates empty 'characterArray' with 25 'Character' objects
        viewModel.getCharacterList()
    }

    
    func bindViewModel(){
        viewModel.characterArray.bindAndFire() { [weak self] _ in
            DispatchQueue.main.async{
                self?.collectionView?.reloadData() 
            }
        }
    }
    
    func setLayout() {
        
        let layout = self.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: ((self.collectionView?.frame.size.width)! - 20)/2, height: (self.collectionView?.frame.size.height)!/3)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return viewModel.characterArray.value.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CharacterCollectionViewCell
        
        let cellViewModel = viewModel.viewCellViewModelsArray[indexPath.row]
        cell.assignViewModel(viewModel: cellViewModel)
        return cell
    }

}
