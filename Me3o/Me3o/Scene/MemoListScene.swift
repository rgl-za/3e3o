//
//  MemoListScen.swift
//  Me3o
//
//  Created by 지현정 on 2021/11/15.
//

import SwiftUI

struct MemoListScene: View{
    @EnvironmentObject var store: MemoStore
    @EnvironmentObject var formatter: DateFormatter
    
    @State var showCompose: Bool = false
    
    @State private var searchText = ""
    
    var body: some View{
        
        NavigationView {
            
            VStack {
                SearchBar(text: $searchText)
                    .padding(.bottom)
                List {
                    ForEach(store.list){ memo in
                        NavigationLink(
                            destination: DetailScene(memo: memo),
                            label: {
                                MemoCell(memo: memo)
                            })
                    }
                    .onDelete(perform: store.delte(set:))
                    
                }
                .navigationTitle("3e3o")
                .navigationBarItems(trailing: ModalButton(show: $showCompose))
                .sheet(isPresented: $showCompose, content: {
                    ComposeScene(showComposer: self.$showCompose)
                        .environmentObject(self.store)
                        .environmentObject(KeyboardObserver())
            })
            }
        }
    }
}

fileprivate struct ModalButton: View{
    @Binding var show: Bool
    
    var body: some View{
        Button(action: {
            self.show = true
        }, label: {
            Image(systemName: "plus")
        })
    }
}

struct MemoListScene_Previews: PreviewProvider {
    static var previews: some View{
        MemoListScene()
            .environmentObject(MemoStore())
            .environmentObject(DateFormatter.memoDateFormatter)
    }
}



