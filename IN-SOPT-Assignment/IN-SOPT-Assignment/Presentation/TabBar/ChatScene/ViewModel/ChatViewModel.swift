//
//  ChatViewModel.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/11/02.
//

import Combine

final class ChatViewModel: ViewModelType {
    
    var chatModel: [ChatModel] = ChatModel.sampleData

    init() {
    }

    struct Input {
    }

    struct Output {
    }
}

extension ChatViewModel {
    func transform(from input: Input) -> Output {
        let output = Output()
        return output
    }
    
    func getChatCellCount() -> Int {
        return chatModel.count
    }
    
    func sortLatestChat() {
        // TODO: - time 최신 순으로 포맷 변경해서 정렬하기
    }
}
