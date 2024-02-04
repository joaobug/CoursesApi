//
//  Course.swift
//  CoursesApi
//
//  Created by Joao Leal on 2/4/24.
//

import Foundation

struct Course: Decodable, Identifiable {
    let id, numberOfLessons: Int
    let name, link, imageUrl: String
    
}
