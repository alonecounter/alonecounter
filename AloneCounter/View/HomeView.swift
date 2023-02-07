//
//  HomeView.swift
//  AloneCounter
//
//  Created by Ba Kien on 28/11/2022.
//

import SwiftUI

struct HomeView: View {
    
    @State var years: Int = 0
    @State var months: Int = 0
    @State var weeks: Int = 0
    @State var days: Int = 0
    @State var hours: Int = 0
    @State var minutes: Int = 0
    @State var seconds: Int = 0
    
    @State var dayCounter: Int = 3600
    @State var timer: Timer? = nil
    @State var dateDiff:String = ""
    
    @State var birthDate = Date.now
    
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                Image("wallpaper")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(.all)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                
                
                VStack {
                    HStack{
                        Spacer()
                        Text("Alone Days Counter")
                            .font(.title)
                            .foregroundColor(.white)
                        Spacer()
                        
                        Button {
                            print("Photo saved to Gallery")
                        } label: {
                            Image(systemName: "house")
                        }
                        .padding()
                        .foregroundColor(.white)
                    }
                    Spacer()
                    
                    ZStack{
                        Circle()
                            .strokeBorder(Color.white, lineWidth: 5)
                            .frame(width: 300, height: 300, alignment: .center)
                        VStack{
                            Text("8723")
                                .font(Font.system(size: 70))
                                .foregroundColor(.white)
                            Text("alone days")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        }
                        
                    }
                    Spacer()
                    
                    var timeUnitNum = [years,months,weeks,days,hours,minutes,seconds]
                    var timeUnit = ["Years","Months","Weeks","Days","Hours","Minutes","Second"]
                    
                    HStack (alignment: .top, spacing: 10){
                       
                        ForEach(0..<7){ index in
                            VStack{
                                Text("\(timeUnitNum[index])")
                                    .foregroundColor(Color.white)
                                    .font(.largeTitle)
                                Text("\(timeUnit[index])")
                                    .lineLimit(1)
                                    .foregroundColor(Color.white)
                                    .font(.title3)
                                    
                            }
                        }
                        
                    }.background(Color.yellow)
                        .frame(width: .infinity, height: 100)
                        .onAppear(){
                            startTimer()
                        }
                    
                    
                    ForEach(1..<5){ index in
                        Spacer()
                    }
                    
            
                }
            }
        }
        
    }
    
    func formatDate()->String{
        var dateTime = ""
        if years < 10 && years >= 0{
            dateTime.append(contentsOf: "0")
        }
        dateTime.append(contentsOf: "\(years)")
        dateTime.append(contentsOf: " ")
        if months < 10 && months >= 0{
            dateTime.append(contentsOf: "0")
        }
        dateTime.append(contentsOf: "\(months)")
        dateTime.append(contentsOf: " ")
        if days < 10 && days >= 0{
            dateTime.append(contentsOf: "0")
        }
        dateTime.append(contentsOf: "\(days)")
        dateTime.append(contentsOf: " ")
        if hours < 10 && hours >= 0{
            dateTime.append(contentsOf: "0")
        }
        dateTime.append(contentsOf: "\(hours)")
        dateTime.append(contentsOf: " ")
        if minutes < 10 && minutes >= 0{
            dateTime.append(contentsOf: "0")
        }
        dateTime.append(contentsOf: "\(minutes)")
        dateTime.append(contentsOf: " ")
        if seconds < 10 && seconds >= 0{
            dateTime.append(contentsOf: "0")
        }
        dateTime.append(contentsOf: "\(seconds)")
        
        return dateTime
    }

    
    
    func startTimer(){
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
            if self.seconds == 59 {
                self.seconds = 0
                if self.minutes == 59 {
                    self.minutes = 0
                    self.hours = self.hours + 1
                    if self.hours == 23 {
                        self.hours = 0
                        self.days = self.days + 1
                        
                    }else {
                        self.hours = self.hours + 1
                    }
                } else {
                    self.minutes = self.minutes + 1
                }
            } else {
                self.seconds = self.seconds + 1
            }
        }
    }
    
    func stopTimer(){
        
        timer?.invalidate()
        timer = nil
    }
    
    func restartTimer(){
        hours = 0
        minutes = 0
        seconds = 0
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



