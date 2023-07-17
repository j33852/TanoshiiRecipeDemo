//
//  AlbumViewModel.swift
//  TanoshiiRecipeDemo
//
//  Created by 張俊傑 on 2023/07/17.
//

import Foundation

class AlbumViewModel: ObservableObject {
    
    @Published private(set) var albumModel: AlbumModel?
    @Published var paginationModel: PaginationModel?
    
    init() {
        Task.init {
            await fetchData()
        }
    }

    func fetchData() async {
        var requestUrl = URL(string: "https://cooking-records.ex.oishi-kenko.com/cooking_records")!
        
        if let paginationModel = paginationModel {
            requestUrl = URL(string: "https://cooking-records.ex.oishi-kenko.com/cooking_records?offset=\(paginationModel.offset)&limit=\(paginationModel.limit)")!
        }
        
        
        let task = URLSession.shared.dataTask(with: requestUrl) { data, response, error in
            if let error = error {
                print("error", error)
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let decoded = try decoder.decode(AlbumModel.self, from: data)
                    DispatchQueue.main.async {
                        self.albumModel = decoded
                    }                } catch {
                    print("error")
                }
            }
        }
        task.resume()
    }
}

