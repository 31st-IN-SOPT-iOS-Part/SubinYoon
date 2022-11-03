//
//  PhotoViewModel.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/11/03.
//

import Combine
import UIKit

final class PhotoViewModel: ViewModelType {
    
    private var cancellable: Set<AnyCancellable> = []
    
    var photoModel: [PhotoModel] = PhotoModel.sampleData

    init() {
    }

    struct Input {
        var photo = PassthroughSubject<PhotoModel, Error>()
    }

    struct Output {
        var count = PassthroughSubject<Int, Never>()
        var isCellClicked = PassthroughSubject<Bool, Never>()
    }
}

extension PhotoViewModel {
    func transform(from input: Input) -> Output {
        let output = Output()
        
        return output
    }
    
    func getPhotoCellCount() -> Int {
        return photoModel.count
    }
}
