//
//  RecShape.swift
//  Login page
//
//  Created by Augustin Diabira on 31/01/2022.
//

import SwiftUI

struct RecShape: View {
    
    @State var themes = ["Cinema", "Music", "Sports", "Arts", "Cinema", "Music", "Sports", "Arts" ]
    var body: some View {
        ScrollView(.horizontal) {
            
            HStack {
                ForEach(0 ..< 8){cell in
                    Rec( themes: $themes)
                }
            }
            
            
        }
    }
}

struct RecShape_Previews: PreviewProvider {
    static var previews: some View {
        RecShape()
    }
}

struct Rec: View {
    var lightwork = LinearGradient(colors: [.blue, .red], startPoint: .topTrailing, endPoint: .bottomLeading)
    
    @Binding var themes:[String]
    
    
    var body: some View {
        ZStack {
            
                Rectangle().foregroundColor(.white.opacity(0)).background(lightwork)
                    .frame(width: 425, height: 403).cornerRadius(50)
                VStack {
                    Text(themes[1]).bold()
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
            
           
        }
    }
}
