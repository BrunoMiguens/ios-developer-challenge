//
//  ComicsViewModel.swift
//  Streetbees TC
//
//  Created by Bruno Filipe Martins da Silva Miguêns on 24/08/18.
//  Copyright © 2018 Bruno Filipe Miguêns. All rights reserved.
//

import UIKit
import Moya
import Result
import NVActivityIndicatorView

class ComicsViewModel {
    
    fileprivate let padding: CGFloat = 10
    fileprivate let loaderSize: CGFloat = 75
    
    fileprivate var loader: NVActivityIndicatorView?
    fileprivate let service: MoyaProvider<MarvelService> = .init()
    fileprivate var data: [Comic] = [] {
        didSet {
            reloadHandler?()
        }
    }
    
    var reloadHandler: (() -> Void)?
    
    deinit {
        reloadHandler = nil
    }
    
}

extension ComicsViewModel {
    
    func setup(collectionView: UICollectionView?) {
        guard let collection = collectionView else { return }
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset.left = padding
        layout.sectionInset.right = padding
        layout.minimumLineSpacing = padding
        layout.minimumInteritemSpacing = padding
        layout.scrollDirection = .horizontal
        
        let width = (collection.bounds.size.width / 3)
        layout.itemSize = .init(width: width, height: width + 50)
        
        collection.collectionViewLayout = layout
        
        collection.register(UINib(nibName: ComicCollectionViewCell.id, bundle: nil), forCellWithReuseIdentifier: ComicCollectionViewCell.id)
    }
    
    func setupLoader(for view: UIView) {
        let y = (view.bounds.size.height / 2) - loaderSize / 2
        let x = (view.bounds.size.width / 2) - loaderSize / 2
        let rect = CGRect(x: x, y: y, width: loaderSize, height: loaderSize)
        
        let loaderView = NVActivityIndicatorView(frame: rect, type: .ballScaleMultiple, color: .lightGray, padding: padding)
        view.addSubview(loaderView)
        loader = loaderView
    }
    
    func comic(at index: Int) -> Comic? {
        guard index < data.count else { return nil }
        return data[index]
    }
    
}

extension ComicsViewModel {
    
    func loadComics() {
        loader?.startAnimating()
        service.request(.comics, completion: validateResponse)
    }
    
    var numberOfRows: Int {
        return data.count
    }
    
    func cellForRow(on collectionView: UICollectionView, at index: IndexPath) -> UICollectionViewCell {
        
        let cmc = comic(at: index.row)
        let cell = UICollectionViewCell()
        
        if let cmcCell = collectionView.dequeueReusableCell(withReuseIdentifier: ComicCollectionViewCell.id, for: index) as? ComicCollectionViewCell {
            cmcCell.comic = cmc
            return cmcCell
        }
        
        return cell
    }
    
}

fileprivate extension ComicsViewModel {
    
    func validateResponse(response: Result<Moya.Response, Moya.MoyaError>) {
        switch response {
            
        case .success(let data): transformData(object: data)
        default: break
            
        }
        
        loader?.stopAnimating()
    }
    
    func transformData(object: Response) {
        guard let dictionary = try? object.mapJSON() as? TCDictionary,
             let comicsData = dictionary?.dictionary(MarvelKey.Api.data),
             let comicsArray = comicsData.array(MarvelKey.Api.results) as? [TCDictionary]
             else { return }
        
        data = comicsArray.map({ Comic(dictionary: $0) })
    }
    
}
