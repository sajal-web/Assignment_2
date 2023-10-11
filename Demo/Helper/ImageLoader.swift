//
//  ImageLoader.swift
//  Demo
//
//  Created by Tapas Kumar Patra on 11/10/23.
//

import Foundation
import SwiftUI
// Custom URLImage view to load images from URL
struct ImageLoader : View{
    let urlString : String
    let width : CGFloat
    let height : CGFloat
    
    @State var data : Data?
    var body: some View{
        if let data = data, let uiimage = UIImage(data: data){
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: width, height: height)
                .background(Color.gray)
        }
        else{
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100,height: 70)
                .background(Color.gray)
                .onAppear{
                    fatchData()
                }
        }
    }
    private func fatchData(){
        guard let url = URL(string: urlString) else{
            return
        }
        let task = URLSession.shared.dataTask(with: url) {data, _, _
            in
            self.data = data
        }
        task.resume()
    }
 
}
