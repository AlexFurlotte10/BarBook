//
//  ContentView.swift
//  Shared
//
//  Created by Alex Furlotte on 2021-01-20. 5
//

import SwiftUI

struct ContentView: View {
    @State var searchText = ""
    @State var isSearching = false
    var body: some View {
        NavigationView {
            ScrollView {
                
                HStack {
                    
                    HStack {
                        TextField("Search terms here", text: $searchText)
                            .padding(.leading, 24)
                        
                    }
                    .padding()
                    .background(Color(.systemGray4))
                    .cornerRadius(6)
                    padding(.horizontal)
                        .onTapGesture(perform:  {
                            isSearching = true
                        })
                        .overlay(
                            HStack {
                                Image(systemName: "magnifyingglass")
                                Spacer()
                                
                                
                                if isSearching {
                                    Button(action: { searchText = "" }, label: {
                                        Image(systemName: "xmark.circle.fill")
                                            .padding(.vertical)
                                    })
                                    
                                }
                                
                            
                            }.padding(.horizontal, 32)
                            .foregroundColor(.gray)
                            .transition(.move(edge: .trailing))
                            .animation(.spring())
                        )
                    
                    if isSearching {
                        Button(action: {
                            isSearching = false
                            searchText = ""
                            
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            
                        }, label: {
                            Text("Cancel")
                                .padding(.trailing)
                                .padding(.leading, 0)
                        })
                        .transition(.move(edge: .trailing))
                        .animation(.spring())
                    }
                }
                
                ForEach((0..<20).filter({ "\($0)".contains(searchText) || searchText.isEmpty }), id: \.self) { num in
                    
                    HStack {
                        Text("\(num)")
                        Spacer()
                    }.padding()
                    Divider()
                        .background(Color(.systemGray4))
                        .padding(.leading)
                }
                
            }
            .navigationTitle("Search Items")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
