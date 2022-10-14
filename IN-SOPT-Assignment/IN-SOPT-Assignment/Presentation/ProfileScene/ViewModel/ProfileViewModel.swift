//
//  ProfileViewModel.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/10/14.
//

import Combine

final class ProfileViewModel: ViewModelType {
    var userModel: UserModel

    init(userModel: UserModel) {
        self.userModel = userModel
    }

    struct Input {
    }

    struct Output {
    }
    
    func getUserName() -> String {
        return userModel.email
    }
}

extension ProfileViewModel {
    func transform(from input: Input) -> Output {
        let output = Output()
        return output
    }
}
