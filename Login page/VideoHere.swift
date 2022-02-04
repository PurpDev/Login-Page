//
//  VideoHere.swift
//  Login page
//
//  Created by Augustin Diabira on 31/01/2022.
//

import SwiftUI
import AVKit

struct VideoHere: View {
    
    let url =  "https://bit.ly/swswift"
    var body: some View {
        VStack {
            
            
            VideoPlayer(player: AVPlayer(url: URL(string: "https://bit.ly/swswift")!)).frame(width: 402, height: 402).cornerRadius(50)
            
        }
    }
}

struct VideoHere_Previews: PreviewProvider {
    static var previews: some View {
        VideoHere()
    }
}
