//
//  ProfileViewModel.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/10/14.
//

import UIKit
import Combine

final class ProfileViewModel: ViewModelType {

    var userModel: FriendsModel
    
    init(userModel: FriendsModel) {
        self.userModel = userModel
    }

    struct Input {
    }

    struct Output {
    }
    
    func getUserName() -> String {
        return userModel.userName
    }
    
    func getUserImage() -> UIImage {
        return userModel.profileImage
    }
}

extension ProfileViewModel {
    func transform(from input: Input) -> Output {
        let output = Output()
        return output
    }
}
