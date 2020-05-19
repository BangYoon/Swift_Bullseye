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
    var sliderTargetDifference: Int {
        abs(self.sliderValueRounded - self.target)
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
            Alert( title: Text(alertTitle()),
                       message: Text(self.scoringMessage()),
                       dismissButton: .default(Text("Awesome!")) {
                            self.startNewRound()
                 }) //End of Alert
            } //End of .alert
            Spacer()
            //Score row
            HStack {
                Button(action: {
                    self.startNewGame()
                }) {
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
        //let difference = abs(self.sliderValueRounded - self.target)
        let points: Int
        if self.sliderTargetDifference == 0 {
            points = 200
        } else if self.sliderTargetDifference == 1 {
            points = 150
        } else {
            points = maximumScore - self.sliderTargetDifference
        }
        return points
    }
    
    func scoringMessage() -> String {
        return "The slider's value is \(self.sliderValueRounded).\n"
                + "The target value is \(self.target).\n"
                + "You scored \(pointsForCurrentRound()) points this round."
    }
    
    func alertTitle() -> String {
        //let difference: Int = abs(self.sliderValueRounded - self.target)
        let title: String
        if self.sliderTargetDifference == 0 {
            title = "Perfect!"
        } else if self.sliderTargetDifference < 5 {
            title = "You almost had it!"
        } else if self.sliderTargetDifference <= 10 {
            title = "Not bad."
        } else {
            title = "Are you even trying?"
        }
        return title
    }
    
    func startNewGame() {
        self.score = 0
        self.round = 1
        self.resetSliderAndTarget()
    }
    
    func startNewRound() {
        self.score = self.score + self.pointsForCurrentRound()
        self.round += 1
        self.resetSliderAndTarget()
    }
    
    func resetSliderAndTarget() {
        self.sliderValue = 50.0
        self.target = Int.random(in: 1...100)
    }
    
} //End of Struct

//========== Preview ==========
//some View : 프로토콜
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()//.previewLayout(.fixed(width: 568, height: 320))
    }
}
