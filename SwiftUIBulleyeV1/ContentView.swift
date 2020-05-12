//
//  ContentView.swift
//  SwiftUIBulleyeV1
//
//  Created by 방윤 on 2020/05/12.
//  Copyright © 2020 BangYoon. All rights reserved.
//

import SwiftUI

//Contentview : 실제로 돌아가는 프로그램
//var body : 스크린 전체 나타냄
//VStack HStack : Vertical Horizontal
struct ContentView: View {
    @State var alertIsVisible: Bool = false
    var body: some View {
        VStack{
            Text("Welcome to my first App")
                .fontWeight(.black)
                .foregroundColor(Color.green)
            
            Button(action: {
                print("Button pressed")
                self.alertIsVisible = true
            }) {
                Text("Hit me!")
            }
            
            //State for alert
            //true -> pop-up
            //dismiss -> false
            .alert(isPresented: self.$alertIsVisible) {
                Alert( title: Text("Hello there!"),
                       message: Text("This is my first pop-up."),
                       dismissButton: .default(Text("Awesome!"))
                )
            } //End of .alert
        } //End of VStack
    } //End of body
}

//some View : 프로토콜
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()//.previewLayout(.fixed(width: 568, height: 320))
    }
}
