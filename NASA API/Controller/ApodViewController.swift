//
//  ApodViewController.swift
//  NASA API
//
//  Created by erick eduardo on 15/01/22.
//

import UIKit



class ApodViewController: UIViewController {

    @IBOutlet weak var apodCollection: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nibCell = UINib(nibName: "ApodCollectionViewCell", bundle: nil)
        apodCollection.register(nibCell, forCellWithReuseIdentifier: "apodCell")
        
        apodCollection.delegate = self
        apodCollection.dataSource = self
        
        NasaClient.getJSON { (data) in
           print(data)
        }
        
    }
}

extension ApodViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let apodCell = collectionView.dequeueReusableCell(withReuseIdentifier: "apodCell", for: indexPath) as? ApodCollectionViewCell ?? ApodCollectionViewCell()
        apodCell.apodText.text = "Nasa"
        //apodCell.apodImage.image = UIImage(named: "")
        
        return apodCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}
