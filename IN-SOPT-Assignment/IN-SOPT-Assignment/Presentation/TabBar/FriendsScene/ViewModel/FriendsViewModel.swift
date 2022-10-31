//
//  FriendsViewModel.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/10/14.
//

import Combine

final class FriendsViewModel: ViewModelType {

    init() {
    }

    struct Input {
    }

    struct Output {
    }
    
    func getUserName() -> String {
        return "윤솝트"
    }
}

extension FriendsViewModel {
    func transform(from input: Input) -> Output {
        let output = Output()
        return output
    }
}
