//
//  DateFormatter+Memo.swift
//  Me3o
//
//  Created by 지현정 on 2021/11/15.
//

import Foundation

extension DateFormatter {
    static let memoDateFormatter: DateFormatter = {
//        let f = DateFormatter()
//        f.dateStyle = .long
//        f.timeStyle = .none
//        f.locale = Locale(identifier: "ko_kr")

//        return f
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY년 M월 d일"
        return formatter
    }()
}

extension DateFormatter: ObservableObject{
    
}
