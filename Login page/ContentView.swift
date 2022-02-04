//
//  ContentView.swift
//  Login page
//
//  Created by Augustin Diabira on 29/10/2021.
//

import SwiftUI

struct ContentView: View {
    
   
    
    var body: some View {
        NavigationView{
         
            }
            
        }
        
        }
    



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .colorScheme(.dark)
    }
}

struct ExtractedView: View {
    @Binding var isPage:Bool
    var body: some View {
        VStack(spacing: 20.0) {
            Button(action: {
                isPage = true
            }, label: {
                Text("Login").font(.largeTitle)
                    .padding(.horizontal, 98.0)
                    .foregroundColor(Color.white)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.purple/*@END_MENU_TOKEN@*/)
                    .cornerRadius(25)
            })
            Button(action: {}, label: {
                Text("Sign up").font(.largeTitle)
                    .padding(.horizontal, 98.0)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(25)
            })
            
            
        }
    }
}
