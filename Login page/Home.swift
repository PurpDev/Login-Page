//
//  Home.swift
//  Login page
//
//  Created by Augustin Diabira on 31/01/2022.
//

import SwiftUI
import AVKit

struct Home: View {
    @EnvironmentObject var model:AppViewModel
    var body: some View {
        ZStack {
            Color("Peach")
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    HStack {
                        Text("Home").bold()
                            .font(.largeTitle)
                        .padding(.trailing, 234)
                        
                        Button {
                            model.signOut()
                        } label: {
                            Image("avatar").resizable()
                                .clipped()
                                .cornerRadius(50)
                                .frame(width: 65, height: 65)
                        }

                      
                    }
                    
                    
                    
                    Text("Scroll to choose your theme").bold().foregroundColor(.white)
                        .font(.system(size: 16))
                        .padding(.trailing, 184)
                        .padding()
                    
                 
                        RecShape()
                    
                    Text("Hologram App Tutorial")
                    
                    VideoHere()

                           
                        
                    
                        
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Home()
                
            Home()
            Home()
        }
    }
}
