//
//  PictureManager.swift
//  Exam
//
//  Created by Montypass on 23.01.2021.
//

import Foundation

class PictureManager: PictureManagerProtocol {
    
    static let shared = PictureManager()
    
    private var storage: [PictureItem] = [
        PictureItem(assetName: "1", displayName: "1", createdAt: "23.01.2021"),
        PictureItem(assetName: "2", displayName: "2", createdAt: "22.01.2021"),
        PictureItem(assetName: "3", displayName: "3", createdAt: "21.01.2021"),
        PictureItem(assetName: "4", displayName: "4", createdAt: "20.01.2021"),
        PictureItem(assetName: "5", displayName: "5", createdAt: "23.01.2021"),
        PictureItem(assetName: "6", displayName: "6", createdAt: "22.01.2021"),
        PictureItem(assetName: "7", displayName: "7", createdAt: "21.01.2021"),
        PictureItem(assetName: "8", displayName: "8", createdAt: "23.01.2021")
    ]
    
    func get(by name: String) -> PictureItem? {
        return storage.first { $0.displayName == name }
    }
    
    func getAll() -> [PictureItem] {
        return storage
    }
    
    func edit(name: String, with newName: String) {
        guard let index = storage.firstIndex(where: { $0.displayName == name })
        else {
            return
        }
        let oldItem = storage[index]
        storage[index] = PictureItem(assetName: oldItem.assetName, displayName: newName, createdAt: oldItem.createdAt)
    }
    
    func delete(by name: String) {
        
        guard let index = storage.firstIndex(where: { $0.displayName == name })
        else
        {
            return
            
        }
        storage.remove(at: index)
    }
}
