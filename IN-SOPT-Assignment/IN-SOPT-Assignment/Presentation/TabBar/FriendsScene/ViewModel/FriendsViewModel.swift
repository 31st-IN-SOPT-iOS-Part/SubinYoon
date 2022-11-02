//
//  FriendsViewModel.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/10/14.
//

import Combine

final class FriendsViewModel: ViewModelType {
    
    var friendsModel: [FriendsModel] = FriendsModel.sampleData

    init() {
    }

    struct Input {
    }

    struct Output {
    }
}

extension FriendsViewModel {
    func transform(from input: Input) -> Output {
        let output = Output()
        return output
    }
    
    func getFriendsCellCount() -> Int {
        return friendsModel.count
    }
    
    func getUserModel() -> UserModel {
        return UserModel()
    }
}
