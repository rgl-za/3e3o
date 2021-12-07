//
//  MemoStore.swift
//  Me3o
//
//  Created by 지현정 on 2021/11/15.
//

// 메모 목록 저장 구현

import Foundation

class MemoStore: ObservableObject{
<<<<<<< HEAD
    @Published var list: [Memo] // 배열을 Publushed 특성으로 선언시 배열을 업데이트 할 때마다 바인딩 되어 있는 뷰도 업데이트 됨
    
    init() { // 더미 데이터 추가
        list = [
=======
    @Published var list: [Memo] // 배열을 Published 특성으로 선언: 바인딩 되어 있는 뷰도 함께 업데이트
    
    init() { // 생성자 생성
        list = [ // 더미 데이터 추가 
>>>>>>> 7c5c5eb0a12c7fc3a1a559b621fb978cad51e910
            Memo(content: "A"),
            Memo(content: "B"),
            Memo(content: "C")
        ]
    }
<<<<<<< HEAD
    func insert(memo: String){ // 입력한 메모를 파라미터로 받은 다음 리스트 배열로 저장
        list.insert(Memo(content: memo), at: 0) // 새로운 메모 항상 가장 위에 배치 (0번 인덱스)
    }
    
    func update(memo: Memo?, content: String){ // 파라미터로 메모와 편집된 내용을 받음
=======
    
    // CRUD 구현
    
    func insert(memo: String){
        list.insert(Memo(content: memo), at: 0) // 새로운 메모 항상 위에 배치
    }
    
    func update(memo: Memo?, content: String){ // 메모와 편집된 내용을 받음
        // 컨텐트 속성에 그대로 저장
>>>>>>> 7c5c5eb0a12c7fc3a1a559b621fb978cad51e910
        guard let memo = memo else { return }
        memo.content = content // 컨텐트 속성에 그대로 저장
    }
    
<<<<<<< HEAD
    func delete(memo: Memo){ // 메모 인스턴스를 받는 delete 버전
        DispatchQueue.main.async { // 메모 인스턴스가 전달되면
            self.list.removeAll{ $0 == memo } // 배열에서 메모를 바로 삭제
        }
    }
    
    func delte(set: IndexSet){ // IndexSet을 받는 delete 버전
        for index in set { // for in문을 돌면서
            self.list.remove(at: index) // 배열에서 삭제
=======
    func delete(memo: Memo){ // 메모 인스턴스를 받는 버전
        DispatchQueue.main.async {
            self.list.removeAll{ $0 == memo } // 배열에서 바로 삭제
        }
    }
    
    func delte(set: IndexSet){ // IndexSet을 받는 버전
        for index in set { 
            self.list.remove(at: index)
>>>>>>> 7c5c5eb0a12c7fc3a1a559b621fb978cad51e910
        }
    }
}

