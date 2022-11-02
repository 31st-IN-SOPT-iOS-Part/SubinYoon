//
//  AuthCompleteViewModel.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/10/13.
//

import Foundation

struct AuthCompleteViewModel {
    var userModel: UserModel
    
    init(userModel: UserModel) {
        self.userModel = userModel
    }
    
    func getUserEmail() -> String {
        return "\(userModel.userName)님\n환영합니다"
    }
}
