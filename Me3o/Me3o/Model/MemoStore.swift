//
//  MemoStore.swift
//  Me3o
//
//  Created by 지현정 on 2021/11/15.
//

// 메모 목록 저장 구현

import Foundation

class MemoStore: ObservableObject{
    @Published var list: [Memo]
    // 배열을 Publushed 특성으로 선언시 배열을 업데이트 할 때마다 바인딩 되어 있는 뷰도 업데이트 됨
    
    init() { // 생성자 생성
        list = [ // 더미 데이터 추가

            Memo(content: "A"),
            Memo(content: "B"),
            Memo(content: "C")
        ]
    }
    
    // CRUD 구현
    
    func insert(memo: String){
        list.insert(Memo(content: memo), at: 0) // 새로운 메모 항상 위에 배치
    }
    
    // 메모와 편집된 내용을 받음
    func update(memo: Memo?, content: String){
        guard let memo = memo else { return }
        
        memo.content = content
    }
    

    func delete(memo: Memo){ // 메모 인스턴스를 받는 버전
        DispatchQueue.main.async {
            self.list.removeAll{ $0 == memo } // 배열에서 바로 삭제
        }
    }
    
    func delte(set: IndexSet){ // IndexSet을 받는 버전
        for index in set {
            self.list.remove(at: index)
        }
    }

}


