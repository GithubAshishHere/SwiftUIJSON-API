//
//  connectApi.swift
//  SwiftUIJsonAPI
//
//  Created by Aashish bapodra on 2/27/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class connectApi: ObservableObject {
    
    
    let willChange = PassthroughSubject<connectApi,Never>()
    @Published var responseValue = [album](){
        willSet{
            willChange.send(self)
        }
    }
    
    func callApi() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/albums")
        let requestURL = URLRequest(url: url!)
        
        URLSession.shared.dataTask(with: requestURL) { (data, response, error) in
            
            guard let data = data else {
                return
            }
            
            let JSONDecodedResponse = try! JSONDecoder().decode([album].self, from: data)
            DispatchQueue.main.async {
                self.responseValue = JSONDecodedResponse
                print(self.responseValue[0].title)
            }
            
            
        }.resume()
    }
    
    
}
