//
//  ProfileViewModel.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/10/14.
//

import Combine

final class ProfileViewModel: ViewModelType {

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

extension ProfileViewModel {
    func transform(from input: Input) -> Output {
        let output = Output()
        return output
    }
}
