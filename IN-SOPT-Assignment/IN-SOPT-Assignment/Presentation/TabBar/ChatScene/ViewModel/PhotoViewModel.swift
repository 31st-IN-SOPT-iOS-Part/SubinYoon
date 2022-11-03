//
//  PhotoViewModel.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/11/03.
//

import Combine
import UIKit

final class PhotoViewModel: ViewModelType {
        
    var photoModel: [PhotoModel] = PhotoModel.sampleData
    private var cancellable: Set<AnyCancellable> = []

    init() {
    }

    struct Input {
        var viewWillAppear: PassthroughSubject<Void, Error>
    }

    struct Output {
        var photoModel = PassthroughSubject<[PhotoModel], Error>()
    }
}

extension PhotoViewModel {
    func transform(from input: Input) -> Output {
        let output = Output()
        
        input.viewWillAppear.sink { _ in
        } receiveValue: { value in
            output.photoModel.send(self.photoModel)
        }.store(in: &cancellable)
        
        return output
    }
}
