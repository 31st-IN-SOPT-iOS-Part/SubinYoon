//
//  SignInViewModel.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/10/13.
//

import Combine

final class SignInViewModel: ViewModelType {
    
    private var cancellable: Set<AnyCancellable> = []
    
    struct Input {
        let emailText: Published<String>.Publisher
        let passwordText: Published<String>.Publisher
    }
    struct Output {
        var isSignInValid = PassthroughSubject<Bool, Never>()
    }
}

extension SignInViewModel {
    func transform(from input: Input) -> Output {
        let output = Output()
        
        input.emailText.combineLatest(input.passwordText).map { info -> Bool in
            return info.0 != "" && info.1 != ""
        }.sink {
            output.isSignInValid.send($0)
        }.store(in: &self.cancellable)
        return output
    }
}
