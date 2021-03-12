//
//  Home.swift
//  Total
//
//  Created by namnguyen on 12/03/2021.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TableView()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
struct TableView:View {
    @State var index = 1
    @State var offset : CGFloat = 0
    var width = UIScreen.main.bounds.width
    var body: some View
    {
        VStack(spacing:0){
            AppBar(index: self.$index, offset: self.$offset)
            GeometryReader{
                g in
                HStack(spacing:0){
                    First().frame(width: g.frame(in: .global).width)
                    Scnd().frame(width: g.frame(in: .global).width)
                    Third().frame(width: g.frame(in: .global).width)
                }.offset(x:self.offset).animation(.default).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
        }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}
struct AppBar:View {
    @Binding var index:Int
    @Binding var offset:CGFloat
    var width = UIScreen.main.bounds.width
    var body: some View{
        VStack(alignment: .leading) {
            HStack{
                Button(action: {
                    self.index = 1
                    self.offset = 0
                }){
                    VStack {
                        HStack(spacing:12)
                        {
                            Image(systemName: "homekit").foregroundColor(self.index == 1 ? .white : Color.white.opacity(0.7))
                            Text("Home").foregroundColor(self.index == 1 ? .white : Color.white.opacity(0.7))
                        }
                        Capsule().fill(self.index == 1 ? Color.white : Color.clear).frame(height:4 )
                    }
                }
                Button(action: {
                    self.index = 2
                    self.offset = -self.width
                }){
                    VStack {
                        HStack(spacing:12)
                        {
                            Image(systemName: "homekit").foregroundColor(self.index == 2 ? .white : Color.white.opacity(0.7))
                            Text("Home").foregroundColor(self.index == 2 ? .white : Color.white.opacity(0.7))
                        }
                        Capsule().fill(self.index == 2 ? Color.white : Color.clear).frame(height:4 )
                    }
                }
                Button(action: {
                    self.index = 3
                    self.offset = -self.width*2
                }){
                    VStack {
                        HStack(spacing:12)
                        {
                            Image(systemName: "homekit").foregroundColor(self.index == 3 ? .white : Color.white.opacity(0.7))
                            Text("Home").foregroundColor(self.index == 3 ? .white : Color.white.opacity(0.7))
                        }
                        Capsule().fill(self.index == 3 ? Color.white : Color.clear).frame(height:4 )
                    }
                }
            }.padding(.top,(UIApplication.shared.windows.first?.safeAreaInsets.top)! + 15).padding(.horizontal).padding(.bottom,8).background(Color.gray)
        }
    }
}
struct First : View {
    var body: some View{
        GeometryReader{
            _ in
            VStack{
                Text("First View")
            }
        }.background(Color.white )
    }
}
struct Scnd : View {
    var body: some View{
        GeometryReader{
            _ in
            VStack{
                Text("Second View")
            }
        }.background(Color.white )
    }
}
struct Third : View {
    var body: some View{
        GeometryReader{
            _ in
            VStack{
                Text("Third View")
            }
        }.background(Color.white )
    }
}
