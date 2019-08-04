//
//  BaseCollectionViewController.swift
//  BottleRocketChallenge
//
//  Created by Jorge Mendoza on 3/8/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class BaseCollectionViewController<T, Cell: UICollectionViewCell>: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var items: [T]? {
        didSet {
            OperationQueue.main.addOperation { [weak self] in
                
                self?.collectionView.reloadData()
//                self?.invalidateIntrinsicContentSize()
            }
        }
    }
    
    var spinner:UIActivityIndicatorView?
    
//    var intrinsicContentSize: CGSize {
//        return self.collectionViewLayout.collectionViewContentSize
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.startSpinner()
        
        getData()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewSize = collectionView.frame.size.width
        
        return CGSize(width: collectionViewSize, height: 180.0)
    }
    
    func startSpinner(){
        
        DispatchQueue.main.async { [weak self] in
            
            self?.spinner?.isHidden = true
            self?.spinner?.hidesWhenStopped = true
            self?.spinner?.startAnimating()
        }
    }
    
    func stopSpinner(){
        
        DispatchQueue.main.async { [weak self] in
            
            self?.spinner?.stopAnimating()
        }
    }
    
    open func getData(){
        
    }

}
