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

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? DetailViewController {
            if let viewModel = sender as? CharacterCollectionViewCellViewModel {
                destination.viewModel = viewModel
            }
        }

    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return viewModel.characterArray.value.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CharacterCollectionViewCell
        
        // Prepares viewModel for assignation to a collectionViewCell
        let cellViewModel = viewModel.viewCellViewModelsArray[indexPath.row]
        cell.assignViewModel(viewModel: cellViewModel)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let viewModel = self.viewModel.viewCellViewModelsArray[indexPath.row]
        performSegue(withIdentifier: "Show", sender: viewModel)
    }

}
