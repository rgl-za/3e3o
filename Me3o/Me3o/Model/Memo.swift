//
//  Memo.swift
//  Me3o
//
//  Created by 지현정 on 2021/11/15.
//

import SwiftUI

// Identifiable: 데이터 목록을 테이블뷰나 컬렉션 뷰에 쉽게 바인딩 가능
// ObservableObject: 반응형 UI를 구현하기 위함

class Memo: Identifiable, ObservableObject{
    let id: UUID // Identifiable 프로토콜이 요구하는 속성, 메모 구분용
    @Published var content: String // @Published: 새로운 값이 저장될 때마다 바인딩되어 있는 UI가 자동으로 업데이트 됨 (메모 내용 저장)
    let insertDate: Date // 메모 생성 날짜 저장
    
    // 생성자 초기화
    init(id: UUID = UUID(), content: String, insertDate: Date = Date()){
        self.id=id
        self.content = content
        self.insertDate = insertDate
    }
}

extension Memo: Equatable {
    static func == (lhs: Memo, rhs: Memo)-> Bool{
        return lhs.id == rhs.id // id 속성 비교
    }
}
