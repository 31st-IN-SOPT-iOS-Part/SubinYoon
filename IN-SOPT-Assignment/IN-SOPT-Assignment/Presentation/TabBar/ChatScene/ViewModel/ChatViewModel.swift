//
//  ChatViewModel.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/11/02.
//

import Combine

final class ChatViewModel: ViewModelType {
    
    var chatModel: [ChatModel] = ChatModel.sampleData
    private var cancellable: Set<AnyCancellable> = []

    init() {
    }

    struct Input {
        var viewWillAppear: PassthroughSubject<Void, Error>
    }

    struct Output {
        var chatModel = PassthroughSubject<[ChatModel], Error>()
    }
}

extension ChatViewModel {
    func transform(from input: Input) -> Output {
        let output = Output()
        
        input.viewWillAppear.sink { _ in
        } receiveValue: { value in
            output.chatModel.send(self.chatModel)
        }.store(in: &cancellable)
        
        return output
    }
    
    func sortLatestChat() {
        // TODO: - time 최신 순으로 포맷 변경해서 정렬하기
    }
}
