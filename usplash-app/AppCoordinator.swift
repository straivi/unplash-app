//
//  AppCoordinator.swift
//  usplash-app
//
//  Created by  Matvey on 06.01.2022.
//

import UIKit

final class AppCoordinator {
    private let tabBarController = MainTabBarController()
    
    var mainController: UIViewController {
        get {
            tabBarController
        }
    }
    
    private func createNavController(with controller: UIViewController, title: String) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.title = title
        return navigationController
    }
    
    init() {
        let viewControllers = [createNavController(with: ViewController(), title: "Corusel")]
        tabBarController.setViewControllers(viewControllers, animated: false)
    }
}
