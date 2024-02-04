//
//  ContentView.swift
//  CoursesApi
//
//  Created by Joao Leal on 2/4/24.
//

import SwiftUI



struct ContentView: View {
    @State private var vm = ContentViewModel()
    @State private var testando = [Course]()
    
    var body: some View {
        NavigationStack{
            ScrollView{
                if vm.isFetching {
                    ProgressView()
                    Text("id getchinggg")
                }
                
                VStack{
                    ForEach(vm.cursos) { curso in
                        
                        let url = URL(string: curso.imageUrl)
                        AsyncImage(url: url) { image in
                            image.resizable()
                                .scaledToFill()
                        }
                    placeholder: {
                        ProgressView()
                    }
                        Text(curso.name)
                    }}
            }
            .navigationTitle("Courses")
            .task {
                await vm.fetchData()
            }
            
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}
