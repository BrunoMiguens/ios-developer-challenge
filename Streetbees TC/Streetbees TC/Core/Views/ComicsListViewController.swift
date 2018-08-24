//
//  ComicsListViewController.swift
//  Streetbees TC
//
//  Created by Bruno Filipe Martins da Silva Miguêns on 24/08/18.
//  Copyright © 2018 Bruno Filipe Miguêns. All rights reserved.
//

import UIKit
import Moya

class ComicsListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate let viewModel: ComicsViewModel = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.reloadHandler = reload
        viewModel.setupLoader(for: view)
        viewModel.setup(collectionView: collectionView)
        
        viewModel.loadComics()
    }
    
}

extension ComicsListViewController {
    
    func reload() {
        collectionView.reloadData()
    }
    
}

extension ComicsListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return viewModel.cellForRow(on: collectionView, at: indexPath)
    }
    
}

