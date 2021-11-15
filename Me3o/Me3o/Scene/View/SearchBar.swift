//
//  SearchBar.swift
//  Me3o
//
//  Created by 지현정 on 2021/11/15.
//

import SwiftUI

struct SearchBar: View{
    
    @Binding var text: String
    
    @State private var isEditing = false
    
    var body: some View{
        
        HStack{
            TextField("Search...", text: $text)
                .frame(height: 40)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth:0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 10)
                        
                        if isEditing {
                            Button(action: {
                                self.text = ""
                                
//                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            }, label: {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 10)
                            })
                        }
                        
                        
                    }
                )
                .padding(.horizontal, 20)
                .onTapGesture {
                    self.isEditing = true
                }
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
            
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }, label: {
                    Text("Cancel")
                })
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
        
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
