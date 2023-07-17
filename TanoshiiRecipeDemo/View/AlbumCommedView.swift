//
//  AlbumCommedView.swift
//  TanoshiiRecipeDemo
//
//  Created by 張俊傑 on 2023/07/17.
//

import SwiftUI

struct AlbumCommedView: View {
    
    var recipe: CookingRecordsModel
    let stackSpecing: CGFloat = 12
    
    var body: some View {
        VStack(alignment: .leading, spacing: stackSpecing) {
            Text(recipe.comment)
                .font(.system(.headline, design: .default))
            
            VStack(alignment: .leading, spacing: stackSpecing) {
                
                HStack(alignment: .center, spacing: 2, content: {
                    Image(systemName: "flame")
                    Text("種類: \(recipe.recipe_type)")
                })
                HStack(alignment: .center, spacing: 2, content: {
                    Image(systemName: "clock")
                    Text("日程: \(recipe.recorded_at)")
                })
            }
            .font(.footnote)
            .foregroundColor(Color.gray)
            
        }
        .padding()
        .padding(.bottom, 12)
    }
}

struct AlbumCommedView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumCommedView(recipe: CookingRecordsModel(image_url: "", comment: "", recipe_type: "", recorded_at: ""))
    }
}
