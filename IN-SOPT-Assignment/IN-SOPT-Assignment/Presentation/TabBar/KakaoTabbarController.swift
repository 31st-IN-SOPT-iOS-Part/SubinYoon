//
//  KakaoTabbarController.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/10/26.
//

import UIKit

class KakaoTabbar: UITabBar {
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class KakaoTabbarController: UITabBarController {
    
    var defaultIndex = 0 {
        didSet {
            self.selectedIndex = defaultIndex
        }
    }
    
    private let clientTabbar = KakaoTabbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.selectedIndex = defaultIndex
        self.setValue(clientTabbar, forKey: "tabBar")
        object_setClass(self.tabBar, KakaoTabbar.self)
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.tabBar.layer.cornerRadius = 20.adjusted
        self.tabBar.itemPositioning = .centered
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

    }
}

extension KakaoTabbarController : UITabBarControllerDelegate {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let friendViewController = ModuleFactory.shared.makeFriendsViewController()
        let friendNavigationController =  UINavigationController(rootViewController: friendViewController)
        
        let chatViewController = ChatViewController()
        let chatNavigationController = UINavigationController(rootViewController: chatViewController)
        
        let searchViewController = SearchViewController()
        let searchNavigationController = UINavigationController(rootViewController: searchViewController)
        
        let shopViewController = ShopViewController()
        let shopNavigationController = UINavigationController(rootViewController: shopViewController)
        
        let settingViewController = SettingViewController()
        let settingNavigationController = UINavigationController(rootViewController: settingViewController)
        
        
        let viewControllers = [
            friendNavigationController,
            chatNavigationController,
            searchNavigationController,
            shopNavigationController,
            settingNavigationController
        ]
        
        viewControllers.forEach {
            $0.navigationBar.isHidden = false
        }
        
        self.setViewControllers(viewControllers, animated: true)
        
        let tabBar: UITabBar = self.tabBar
        tabBar.backgroundColor = UIColor.white
        tabBar.barStyle = UIBarStyle.default
        tabBar.barTintColor = UIColor.white
        
        
        let imageNames = [
            ImageLiterals.friendTabIcn,
            ImageLiterals.chatTabIcn,
            ImageLiterals.searchTabIcn,
            ImageLiterals.shopTabIcn,
            ImageLiterals.settingTabIcn
        ]
        
        let imageSelectedNames = [
            ImageLiterals.friendTabIcnSelected,
            ImageLiterals.chatTabIcnSelected,
            ImageLiterals.searchTabIcnSelected,
            ImageLiterals.shopTabIcnSelected,
            ImageLiterals.settingTabIcnSelected
        ]
        
        
        for (index, value) in (tabBar.items?.enumerated())! {
            let tabBarItem: UITabBarItem = value as UITabBarItem
            
            tabBarItem.image = imageNames[index].withRenderingMode(.alwaysOriginal)
            tabBarItem.selectedImage = imageSelectedNames[index].withRenderingMode(.alwaysOriginal)
        }
    }
}
