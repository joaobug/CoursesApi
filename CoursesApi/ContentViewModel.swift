//
//  ContentViewModel.swift
//  CoursesApi
//
//  Created by Joao Leal on 2/4/24.
//

import Foundation

@Observable
class ContentViewModel {
    
    var cursos = [Course]()
    var isFetching = false
    
    init() {
       // DispatchQueue.main.asyncAfter(deadline: .now() + 3) { self.isFetching = true
        }
    

     func fetchData () async {
        guard let url = URL(string: "https://api.letsbuildthatapp.com/jsondecodable/courses") else {
            fatalError()
        }
         do{
             isFetching = true
             let(data, response) = try await URLSession.shared.data(from: url)
             
             guard let resp = response as? HTTPURLResponse, resp.statusCode == 200 else {
                 fatalError()
             }
             
             
             self.cursos = try JSONDecoder().decode([Course].self, from: data)
             isFetching = false
             
             
         }
        catch{
            isFetching = false
            print("error")
        }
         
   
    }
    
}
