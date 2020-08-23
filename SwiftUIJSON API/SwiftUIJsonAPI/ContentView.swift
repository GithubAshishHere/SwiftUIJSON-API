//
//  ContentView.swift
//  SwiftUIJsonAPI
//
//  Created by Aashish bapodra on 2/27/20.
//  Copyright © 2020 Test. All rights reserved.
//

import SwiftUI

struct album: Decodable {
    var userId,id: Int
    var title: String
    
}

struct ContentView: View {
    
    
    
    @ObservedObject var manager = connectApi()
    
    
    var pokemonList = [
        album(userId: 0, id: 0, title: "Title1"),
        album(userId: 1, id: 1, title: "Title2"),
        album(userId: 2, id: 2, title: "Title3"),
        album(userId: 3, id: 3, title: "Title4"),
    ]
    var body: some View {
        
        List(manager.responseValue, id: \.id) { pokemon in
            HStack {
                Text("\(pokemon.id)")
                Text(pokemon.title)
                
            }
        }.onAppear(perform: manager.callApi)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
