//
//  ViewController.swift
//  usplash-app
//
//  Created by  Matvey on 06.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let collectionView = GalleryCollectionVeiw()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
        setupLayout()
        
        let sushiModels = SushiModel.fetchSushi()
        collectionView.setSushiModel(with: sushiModels)
    }
    
    private func setupViews() {
        view.backgroundColor = .magenta
    }


    private func setupLayout() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        let colllecionVeiwConstrainst = [
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 25),
            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -25),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ]
        NSLayoutConstraint.activate(colllecionVeiwConstrainst)
    }
}


