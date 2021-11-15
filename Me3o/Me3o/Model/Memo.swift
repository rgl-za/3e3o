//
//  Memo.swift
//  Me3o
//
//  Created by 지현정 on 2021/11/15.
//

import SwiftUI

class Memo: Identifiable, ObservableObject{
    let id: UUID
    @Published var content: String
    let insertDate: Date
    
    // 초기화 생성자
    init(id: UUID = UUID(), content: String, insertDate: Date = Date()){
        self.id=id
        self.content = content
        self.insertDate = insertDate
    }
}

extension Memo: Equatable {
    static func == (lhs: Memo, rhs: Memo)-> Bool{
        return lhs.id == rhs.id
    }
}
