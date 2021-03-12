//
//  ContentView.swift
//  Total
//
//  Created by namnguyen on 12/03/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Menu()
    }
}
struct TabBar:View {
    @State var selectedtab = "home"
    @State var with = UIScreen.main.bounds.width  - 90
    @State var x = -UIScreen.main.bounds.width  +  90
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View
    {
        ZStack(alignment:Alignment(horizontal: .center, vertical: .bottom)) {
                        TabView(selection:$selectedtab){
                // chuyển đổi giữa các view
                Home().tag("house")
                Box().tag("archivebox.circle.fill")
                Bell().tag("bell.fill")
                Messenge().tag("message")
                
            }
            HStack (spacing:0)
            {
                ForEach(tabs,id : \.self){image in
                    Button(action: {
                        withAnimation(.spring()){
                            selectedtab = image
                        }
                    }, label: {
                        Image(systemName: image).resizable().renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/).aspectRatio( contentMode: .fit).frame(width: 25, height: 25).foregroundColor(selectedtab == image ? getColor(image: image) : Color.blue)
                    })
                    if image != tabs.last{Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)}
                    
                }
            }.padding(.horizontal,30).padding(.vertical).background(Color.gray).cornerRadius(30).padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom).background(Color.white)
        }.ignoresSafeArea(.all,edges: .bottom)
    }
    func getColor(image:String) -> Color {
        switch image {
        case "house":
            return Color(.white)
        case "archivebox.circle.fill":
            return Color(.white)
        case "bell.fill":
            return Color(.white)
        default:
            return Color(.white)
        }
    }
}
var tabs = ["house","archivebox.circle.fill","bell.fill","message"]
