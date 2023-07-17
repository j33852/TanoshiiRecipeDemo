//
//  AlbumCardView.swift
//  TanoshiiRecipeDemo
//
//  Created by 張俊傑 on 2023/07/17.
//

import SwiftUI
import Kingfisher

struct AlbumCardView: View {
    
    var recipe: CookingRecordsModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            KFImage(URL(string: recipe.image_url))
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            AlbumCommedView(recipe: recipe)
                
        }
        .background(Color("ColorBackgroundAdaptive"))
        .cornerRadius(12)
        .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 0)
      
        
    }
}

//struct AlbumCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        AlbumCardView()
//    }
//}
