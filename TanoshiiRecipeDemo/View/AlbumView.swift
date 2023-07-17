//
//  AlbumView.swift
//  TanoshiiRecipeDemo
//
//  Created by 張俊傑 on 2023/07/17.
//

import SwiftUI
import Kingfisher

struct AlbumView: View {
    let spaceName = "scroll"
    
    @StateObject var albumViewModel = AlbumViewModel()
    @State var wholeSize: CGSize = .zero
    @State var scrollViewSize: CGSize = .zero
    
    var body: some View {
        if let albumData = albumViewModel.albumModel {
            ChildSizeReader(size: $wholeSize) {
                
                ScrollView(.vertical, showsIndicators: false) {
                    ChildSizeReader(size: $scrollViewSize) {
                        VStack(alignment: .leading, spacing: 20) {
                            
                            ForEach(0..<albumData.cooking_records.count) { row in
                                AlbumCardView(recipe: albumData.cooking_records[row])
                            }
                        }
                        .padding(.horizontal, 30)
                        .padding(.bottom, 160)
                        .background(
                            GeometryReader { proxy in
                                Color.clear.preference(
                                    key: ViewOffsetKey.self,
                                    value: -1 * proxy.frame(in: .named(spaceName)).origin.y
                                )
                            }
                        )
                        .onPreferenceChange(
                            ViewOffsetKey.self,
                            perform: { value in
                                print("offset: \(value)")
                                print("height: \(scrollViewSize.height)")
                                
                                // FIXME: Not yet to get the new datas
                                if value >= scrollViewSize.height - wholeSize.height {
                                    print("reached bottom")
                                } else {
                                    print("not reached.")
                                }
                            }
                        )
                    }
                }
                .coordinateSpace(name: spaceName)
            }
            .onChange(
                of: scrollViewSize,
                perform: { value in
                    print(value)
                }
            )
        } else {
            VStack {
                Text("データはないです。")
                Image(systemName: "filemenu.and.cursorarrow")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
        }
    }
}

struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView()
    }
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}

struct ChildSizeReader<Content: View>: View {
    @Binding var size: CGSize
    
    let content: () -> Content
    var body: some View {
        ZStack {
            content().background(
                GeometryReader { proxy in
                    Color.clear.preference(
                        key: SizePreferenceKey.self,
                        value: proxy.size
                    )
                }
            )
        }
        .onPreferenceChange(SizePreferenceKey.self) { preferences in
            self.size = preferences
        }
    }
}

struct SizePreferenceKey: PreferenceKey {
    typealias Value = CGSize
    static var defaultValue: Value = .zero
    
    static func reduce(value _: inout Value, nextValue: () -> Value) {
        _ = nextValue()
    }
}
