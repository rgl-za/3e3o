//
//  MemoStore.swift
//  Me3o
//
//  Created by 지현정 on 2021/11/15.
//

import Foundation

class MemoStore: ObservableObject{
    @Published var list: [Memo] // 배열을 Published 특성으로 선언: 바인딩 되어 있는 뷰도 함께 업데이트
    
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
    
    func update(memo: Memo?, content: String){ // 메모와 편집된 내용을 받음
        // 컨텐트 속성에 그대로 저장
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

