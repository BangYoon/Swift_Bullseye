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
    //Stage for User Interface view
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 1
    
    //Properties
    var sliderValueRounded: Int {
        Int(self.sliderValue.rounded())
    }
    
    var body: some View {
        VStack{
            Spacer()
            //Target row
            HStack {
                Text("Put the bull eye as close as you can do:")
                //Text("100")
                Text("\(self.target)")
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
                //print("Button pressed")
                print("Points awarded: \(self.pointsForCurrentRound())")
                self.alertIsVisible = true
            }) {
                Text("Hit me!")
            }
            //State for alert (true -> pop_up, dismiss -> false)
            .alert(isPresented: self.$alertIsVisible) {
                Alert( title: Text("Hello there!"),
                       message: Text(self.scoringMessage()),
                       dismissButton: .default(Text("Awesome!")) {
                            self.score = self.score + self.pointsForCurrentRound()
                            self.target = Int.random(in: 1...100)
                            self.round += 1
                }) //End of Alert
            } //End of .alert
            Spacer()
            //Score row
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Start over")
                }
                Spacer()
                Text("Score:")
                //Text("999999")
                Text("\(self.score)")
                Spacer()
                Text("Round")
                //Text("999")
                Text("\(self.round)")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Inform")
                }
            }.padding(.bottom, 20)
        } //End of VStack
    } //End of body
    
    //========== Methods ==========
    func pointsForCurrentRound() -> Int {
        let maximumScore = 100
        let difference = abs(self.sliderValueRounded - self.target)
        return maximumScore - difference
    }
    
    func scoringMessage() -> String {
        return "The slider's value is \(self.sliderValueRounded).\n"
                + "The target value is \(self.target).\n"
                + "You scored \(pointsForCurrentRound()) points this round."
    }
    
} //End of Struct

//========== Preview ==========
//some View : 프로토콜
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()//.previewLayout(.fixed(width: 568, height: 320))
    }
}
