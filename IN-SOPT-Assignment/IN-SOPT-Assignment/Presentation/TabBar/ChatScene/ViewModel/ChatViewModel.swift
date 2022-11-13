//
//  ChatViewModel.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/11/02.
//

import UIKit
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
            self.sortLatestChat()
            output.chatModel.send(self.chatModel)
        }.store(in: &cancellable)
        
        return output
    }
    
    func sortLatestChat() {
        self.chatModel.sort {
            stringToDate(dateStr: $0.time) > stringToDate(dateStr: $1.time)
        }
    }
    
    func stringToDate(dateStr: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        return dateFormatter.date(from: dateStr)!
    }
}
