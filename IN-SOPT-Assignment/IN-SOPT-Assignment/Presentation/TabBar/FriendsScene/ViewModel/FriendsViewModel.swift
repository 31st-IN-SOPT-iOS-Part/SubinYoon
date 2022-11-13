//
//  FriendsViewModel.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/10/14.
//

import Combine

final class FriendsViewModel: ViewModelType {
    
    var friendsModel: [FriendsModel] = FriendsModel.sampleData
    private var cancellable: Set<AnyCancellable> = []

    init() {
    }

    struct Input {
        var viewWillAppear: PassthroughSubject<Void, Error>
    }

    struct Output {
        var friendsModel = PassthroughSubject<[FriendsModel], Error>()
    }
}

extension FriendsViewModel {
    func transform(from input: Input) -> Output {
        let output = Output()
        
        input.viewWillAppear.sink { _ in
        } receiveValue: { value in
            output.friendsModel.send(self.friendsModel)
        }.store(in: &cancellable)
        
        return output
    }
    
    func getUserModel() -> UserModel {
        return UserModel()
    }
}

