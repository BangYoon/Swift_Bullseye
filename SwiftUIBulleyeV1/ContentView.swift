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
    //========== Properties ==========
    
    //Stage for User Interface view
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    
    var body: some View {
        VStack{
            Spacer()
            //Target row
            HStack {
                Text("Put the bull eye as close as you can do:")
                Text("100")
            }
            Spacer()
            
            //Slider row
            HStack {
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            Spacer()
            
            //Button row
            Button(action: {
                print("Button pressed")
                self.alertIsVisible = true
            }) {
                Text("Hit me!")
            }
                
            //State for alert (true -> pop_up, dismiss -> false)
            .alert(isPresented: self.$alertIsVisible) {
                Alert( title: Text("Hello there!"),
                       message: Text("The slider's value is \(Int(self.sliderValue.rounded()))."),
                       dismissButton: .default(Text("Awesome!")) )
            } //End of .alert
            Spacer()
            
            //Score row
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Start over")
                }
                Spacer()
                Text("Score:")
                Text("999999")
                Spacer()
                Text("Round")
                Text("999")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Inform")
                }
            }.padding(.bottom, 20)
            
        } //End of VStack
    } //End of body
    
    //Methods
    
} //End of Struct

//========== Preview ==========
//some View : 프로토콜
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()//.previewLayout(.fixed(width: 568, height: 320))
    }
}
