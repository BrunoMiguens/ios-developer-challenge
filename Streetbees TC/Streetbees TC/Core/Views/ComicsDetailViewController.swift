//
//  ComicsDetailViewController.swift
//  Streetbees TC
//
//  Created by Bruno Filipe Martins da Silva Miguêns on 24/08/18.
//  Copyright © 2018 Bruno Filipe Miguêns. All rights reserved.
//

import UIKit

class ComicsDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    fileprivate let viewModel: ComicsDetailViewModel = .init()
    
    var comic: Comic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateLayout()
    }
    
}

extension ComicsDetailViewController {
    
    func updateLayout() {
        titleLabel.text = comic?.title
        descriptionLabel.text = comic?.description
        viewModel.update(imageView: imageView, with: comic)
    }
    
    @IBAction func hasClickedCloseButton(sender: UIButton?) {
        viewModel.dismiss(from: self)
    }
    
}
