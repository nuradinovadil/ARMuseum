//
//  ViewController.swift
//  ARs
//
//  Created by Nuradinov Adil on 14/04/23.
//

import UIKit
import SnapKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = UIColor(red: 116/255, green: 0/255, blue: 40/255, alpha: 1)
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: TicketViewController())
        let vc3 = UINavigationController(rootViewController: ARViewController())
        let vc4 = UINavigationController(rootViewController: ExploreViewController())
        let vc5 = UINavigationController(rootViewController: SettingsViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc1.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        vc2.tabBarItem.image = UIImage(systemName: "ticket")
        vc2.tabBarItem.selectedImage = UIImage(systemName: "ticket.fill")
        vc3.tabBarItem.image = UIImage(systemName: "camera")
        vc3.tabBarItem.selectedImage = UIImage(systemName: "camera.fill")
        vc4.tabBarItem.image = UIImage(systemName: "mappin.circle")
        vc4.tabBarItem.selectedImage = UIImage(systemName: "mappin.circle.fill")
        vc5.tabBarItem.image = UIImage(systemName: "gearshape")
        vc5.tabBarItem.selectedImage = UIImage(systemName: "gearshape.fill")
        
        vc1.title = "Home"
        vc2.title = "Tickets"
        vc3.title = "AR"
        vc4.title = "Explore"
        vc5.title = "Settings"
        
        setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)
    }

}

