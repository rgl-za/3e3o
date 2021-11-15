//
//  MemoCell.swift
//  Me3o
//
//  Created by 지현정 on 2021/11/15.
//

import SwiftUI

struct MemoCell: View {
    @ObservedObject var memo: Memo
    @EnvironmentObject var formatter: DateFormatter
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(memo.content)
                .font(.body)
                .lineLimit(1)
            
            Text("\(memo.insertDate, formatter: self.formatter)")
            
        }
    }
}

struct MemoCell_Previews: PreviewProvider {
    static var previews: some View{
        MemoCell(memo: Memo(content: "test"))
            .environmentObject(DateFormatter.memoDateFormatter)
    }
}
