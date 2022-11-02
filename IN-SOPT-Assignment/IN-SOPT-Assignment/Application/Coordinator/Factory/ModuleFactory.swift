//
//  ModuleFactory.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/10/17.
//

import Foundation

protocol ModuleFactoryProtocol {
    func makeSignInViewController() -> SignInViewController
    func makeSignUpViewController() -> SignUpViewController
    func makeAuthCompleteViewController(email: String, password: String) -> AuthCompleteViewController
    func makeFriendsViewController(userModel: UserModel) -> FriendsViewController
    func makeProfileViewController(userModel: FriendsModel) -> ProfileViewController
    func makeChatViewController() -> ChatViewController
    func makeTabbarController() -> KakaoTabbarController
}

final class ModuleFactory: ModuleFactoryProtocol {
    
    static let shared = ModuleFactory()
    private init() { }
    
    func makeSignInViewController() -> SignInViewController {
        let viewModel = SignInViewModel()
        let signInViewController = SignInViewController()
        signInViewController.viewModel = viewModel
        return signInViewController
    }
    
    func makeSignUpViewController() -> SignUpViewController {
        let viewModel = SignUpViewModel()
        let signUpViewController = SignUpViewController()
        signUpViewController.viewModel = viewModel
        return signUpViewController
    }
    
    func makeAuthCompleteViewController(email: String, password: String) -> AuthCompleteViewController {
        let userModel = UserModel(userName: email, caption: password)
        let viewModel = AuthCompleteViewModel(userModel: userModel)
        let authCompleteViewController = AuthCompleteViewController()
        authCompleteViewController.viewModel = viewModel
        return authCompleteViewController
    }
    
    func makeFriendsViewController(userModel: UserModel) -> FriendsViewController {
        let viewModel = FriendsViewModel()
        let friendsViewController = FriendsViewController()
        friendsViewController.viewModel = viewModel
        return friendsViewController
    }
    
    func makeProfileViewController(userModel: FriendsModel) -> ProfileViewController {
        let viewModel = ProfileViewModel(userModel: userModel)
        let profileViewController = ProfileViewController()
        profileViewController.viewModel = viewModel
        return profileViewController
    }
    
    func makeChatViewController() -> ChatViewController {
        let viewModel = ChatViewModel()
        let chatViewController = ChatViewController()
        chatViewController.viewModel = viewModel
        return chatViewController
    }
    
    func makeTabbarController() -> KakaoTabbarController {
        let tabbarController = KakaoTabbarController()
        return tabbarController
    }
}
