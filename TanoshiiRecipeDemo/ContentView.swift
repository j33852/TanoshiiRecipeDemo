//
//  ContentView.swift
//  TanoshiiRecipeDemo
//
//  Created by 張俊傑 on 2023/07/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            AlbumView()
                .tabItem {
                    VStack{
                        Text("Recipe")
                        Image(systemName: "fork.knife.circle")
                    }
                }
            SearchView()
                .tabItem {
                    VStack{
                        Text("Search")
                        Image(systemName: "magnifyingglass.circle.fill")
                    }
                }
        }
        .environmentObject(AlbumViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
