//
//  PictureManagerProtocol.swift
//  Exam
//
//  Created by Montypass on 23.01.2021.
//

import Foundation

protocol PictureManagerProtocol: AnyObject {
    
    func get(by name: String) -> PictureItem?
    
    func getAll() -> [PictureItem]
    
    func edit(name: String, with newName: String)
    
    func delete(by name: String)
}
