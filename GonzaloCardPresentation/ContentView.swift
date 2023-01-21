//
//  ContentView.swift
//  GonzaloCardPresentation
//
//  Created by gonzalo trujillo vallejo on 21/1/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var useLargeTitle = false
    
    var body: some View {
        ZStack{
            Color(red: 0.20, green: 0.29, blue: 0.37)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("GonImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200 , height: 200)
                    .clipShape(Circle())
                    .frame(width: 200, height: 200)
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 5)
                    )
                Text("Gonzalo Trujillo")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .bold()
                    .foregroundColor(.white)
                Text("iOS Developer")
                    .monospaced(useLargeTitle)
                    .font(.system(size: 25))
                    .foregroundColor(useLargeTitle ? .red : .white)
                    .font(useLargeTitle ? .title : .body)
                    .fontWeight(useLargeTitle ? .black : .ultraLight)
                    .padding(useLargeTitle ? EdgeInsets(top: 2, leading: 25, bottom: 45, trailing: 25) : EdgeInsets())
                    .onTapGesture {
                        withAnimation {
                            useLargeTitle.toggle()
                        }
                    }
                Divider()
                InfoView(text: "+34 661 666 805", imageName: "phone.fill")
                InfoView(text: "gonzalotrujillovallejo@gmail.com", imageName: "envelope.fill")
            }
            .padding(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct InfoView: View {
    var text: String
    var imageName: String
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.white)
            .frame(height: 50)
            .overlay(
                HStack {
                    Image(systemName: imageName)
                        .foregroundColor(.green)
                    Text(text)
                }
            )
    }
}

