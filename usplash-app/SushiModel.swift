//
//  SushiModel.swift
//  usplash-app
//
//  Created by  Matvey on 06.01.2022.
//
import UIKit

struct SushiModel {
    var mainImage: UIImage
    var sushiName: String
    var smallDescription: String
    var cost: Int
    
    static func fetchSushi() -> [SushiModel] {
        let firstItem = SushiModel(mainImage: UIImage(named: "sushi1")!,
                               sushiName: "Jengibre",
                               smallDescription: "Original Japanese",
                               cost: 8)
        let secondItem = SushiModel(mainImage: UIImage(named: "sushi2")!,
                                    sushiName: "Caviar",
                                    smallDescription: "Original Japanese",
                                    cost: 10)
        let thirdItem = SushiModel(mainImage: UIImage(named: "sushi3")!,
                                   sushiName: "Camaron",
                                   smallDescription: "Original Japanese",
                                   cost: 7)
        
        let fouthItem = SushiModel(mainImage: UIImage(named: "sushi4")!,
                                   sushiName: "Salmon",
                                   smallDescription: "Original Japanese",
                                   cost: 12)
        
        let five = SushiModel(mainImage: UIImage(named: "sushi1")!,
                                   sushiName: "Jengibre",
                                   smallDescription: "Original Japanese",
                                   cost: 8)
        let six = SushiModel(mainImage: UIImage(named: "sushi2")!,
                                    sushiName: "Caviar",
                                    smallDescription: "Original Japanese",
                                    cost: 10)
        let seven = SushiModel(mainImage: UIImage(named: "sushi3")!,
                                   sushiName: "Camaron",
                                   smallDescription: "Original Japanese",
                                   cost: 7)
        
        let eight = SushiModel(mainImage: UIImage(named: "sushi4")!,
                                   sushiName: "Salmon",
                                   smallDescription: "Original Japanese",
                                   cost: 12)
        
        
        return [firstItem, secondItem, thirdItem, fouthItem, five, six, seven, eight]
    }
}

struct Constants {
    static let leftDistanceToView: CGFloat = 40
    static let rightDistanceToView: CGFloat = 40
    static let galleryMinimumLineSpacing: CGFloat = 10
    static let galleryItemWidth = (UIScreen.main.bounds.width - Constants.leftDistanceToView - Constants.rightDistanceToView - (Constants.galleryMinimumLineSpacing / 2)) / 2
}
