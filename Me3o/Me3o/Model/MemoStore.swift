//
//  MemoStore.swift
//  Me3o
//
//  Created by 지현정 on 2021/11/15.
//

import Foundation

class MemoStore: ObservableObject{
    @Published var list: [Memo]
    
    init() {
        list = [
            Memo(content: "A"),
            Memo(content: "B"),
            Memo(content: "C")
        ]
    }
    func insert(memo: String){
        list.insert(Memo(content: memo), at: 0) // 새로운 메모 항상 위에
    }
    
    func update(memo: Memo?, content: String){
        guard let memo = memo else { return }
        memo.content = content
    }
    
    func delete(memo: Memo){
        DispatchQueue.main.async {
            self.list.removeAll{ $0 == memo }
        }
    }
    
    func delte(set: IndexSet){
        for index in set {
            self.list.remove(at: index)
        }
    }
}

