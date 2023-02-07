//
//  DiscoverView.swift
//  AloneCounter
//
//  Created by Ba Kien on 28/11/2022.
//

import SwiftUI


struct DiscoverView: View {
    var body: some View {
        ZStack{
            VStack{
                Text("Discovery")
                    .font(.largeTitle)
                    .foregroundColor(.black)

                HStack{
                    VStack(alignment: .leading){
                        Image(systemName: "house")
                    }
                    Spacer()
                    HStack(alignment: .center){
                        Image(systemName: "house")
                        Text("Female")
                    }
                    Spacer()
                    VStack(alignment: .trailing){
                        Image(systemName: "house")
                    }
                    
                }
                VStack(){
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100, alignment: .leading )
                    .background(
                        Image("discover").resizable())
                
                List{
                    DicoverItem(avatar: "avt",name: "Girl",age: 20, sex: 0,horoscope: "Cu giai",status: "Em co don qua",alonedays: 100)
                    DicoverItem(avatar: "avt",name: "Boy",age: 20, sex: 0,horoscope: "Cu giai",status: "Co ai yeu em khong",alonedays: 100)
                    DicoverItem(avatar: "avt",name: "Bede",age: 20, sex: 0,horoscope: "Cu giai",status: "Co don se chien thang",alonedays: 100)
                    DicoverItem(avatar: "avt",name: "Girl",age: 20, sex: 0,horoscope: "Cu giai",status: "Hehe",alonedays: 100)
                    DicoverItem(avatar: "avt",name: "Boy",age: 20, sex: 0,horoscope: "Cu giai",status: "Khong co gi",alonedays: 100)
                }
                
                Spacer()
            }
            
        }
        
        
    }
}

 struct DicoverItem: View {
    var avatar : String
    var name : String
    var age: Int
    var sex: Int
    var horoscope : String
    var status : String
    var alonedays : Int
    
    var body: some View{
        HStack{
            VStack{}.frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 100, alignment: .leading)
                .background(
                    Image("avt").resizable())
            VStack{
                HStack{
                    Text("\(name)")
                    HStack{
                        Image("icon").frame(minWidth: 0, maxWidth: 10, minHeight: 0, maxHeight: 10, alignment: .topLeading)
                        Text("\(age)")
                    }.background(Color("pink").clipShape(RoundedRectangle(cornerRadius:20)))
                    Image("\(horoscope)")
                }
                VStack{
                    Text(status)
                }
                HStack{
                    Image("calendar").frame(minWidth: 0, maxWidth: 10, minHeight: 0, maxHeight: 10, alignment: .topLeading)
                    Text("\(alonedays) alone days")
                }
            }
        }
    }
    
}
