//
//  SignUpViewModel.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/10/13.
//

import Combine

final class SignUpViewModel: ViewModelType {
    
    private var cancellable: Set<AnyCancellable> = []
    
    struct Input {
        let emailText: Published<String>.Publisher
        let passwordText: Published<String>.Publisher
        let passwordCheckText: Published<String>.Publisher
    }
    
    struct Output{
        var isSignUpValid = PassthroughSubject<Bool, Never>()
    }
}

extension SignUpViewModel {
    func transform(from input: Input) -> Output {
        let output = Output()
        
        input.emailText.combineLatest(input.passwordText, input.passwordCheckText)
            .map { info -> Bool in
                return info.0 != "" && info.1 != "" && info.2 != "" && info.1 == info.2
            }.sink {
                output.isSignUpValid.send($0)
            }.store(in: &self.cancellable)
        return output
    }
}
