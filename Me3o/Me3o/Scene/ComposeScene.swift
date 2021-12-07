//
//  ComposeScene.swift
//  Me3o
//
//  Created by 지현정 on 2021/11/15.
//

import SwiftUI

struct ComposeScene: View{
    @EnvironmentObject var keyboard: KeyboardObserver
    @EnvironmentObject var store: MemoStore
    @State private var content: String = "" // 입력할 텍스트를 바인딩 할 때 사용 할 속성
    
    @Binding var showComposer: Bool
    
    var memo: Memo? = nil
    
    var body: some View{
        NavigationView {
            VStack {
//                TextField("", text: $content)
                TextView(text: $content)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.bottom, keyboard.context.height)
                    .animation(.easeInOut(duration: keyboard.context.animationDuration))
                    .background(Color.blue)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarTitle(memo != nil ? "Edit": "NEW" , displayMode: .inline)
            .navigationBarItems(leading: DismissButton(show: $showComposer), trailing: SaveButton(show: $showComposer, content: $content, memo: memo))
        }
        .onAppear{
            self.content = self.memo?.content ?? ""
        }
    }
}

fileprivate struct DismissButton: View{
    @Binding var show: Bool
    
    var body: some View{
        Button(action: {
            self.show = false
        }, label: {
            Text("Cancel")
        })
    }
}

fileprivate struct SaveButton: View{
    @Binding var show: Bool
    
    @EnvironmentObject var store: MemoStore
    @Binding var content: String
    
    var memo: Memo? = nil
    
    var body: some View {
        Button(action: {
            if let memo = self.memo{
                self.store.update(memo: memo, content: self.content)
            } else {
                self.store.insert(memo: self.content)
            }
            
            self.show = false
        }, label: {
            Text("Save")
        })
    }
}

struct ComposeScene_Previews: PreviewProvider{
    static var previews: some View{
        ComposeScene(showComposer: .constant(false))
            .environmentObject(MemoStore())
            .environmentObject(KeyboardObserver())
    }
}
