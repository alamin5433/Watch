//
//  ContentView.swift
//  Watch
//
//  Created by Al Amin on 20/5/20.
//  Copyright © 2020 Al Amin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showDetail = false
    var body: some View {
        ZStack{
            
            Home(showDetail: self.$showDetail)
                .opacity(self.showDetail ? 0 : 1)
            DetailView(showDetail: $showDetail)
                .frame(width: self.showDetail ? nil : 100 , height: self.showDetail ? nil : 100)
            .opacity(self.showDetail ? 1 : 0)
        }
        .animation(.default)
        .preferredColorScheme(self.showDetail ? .dark : .light)
        
   // DetailView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    @State private var tabSelect = 0
    @State private var selectMenu = "ALL"
    @Binding var showDetail:Bool
    var bottom = UIApplication.shared.windows.first?.safeAreaInsets.bottom
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.06).edgesIgnoringSafeArea(.all)
            VStack(spacing: 35){
                TopFirstView()
                .padding(.horizontal)

                TopSeceondView()
                .padding(.horizontal)

                MiddleFirstView(selectMenu: self.$selectMenu)
                .padding(.horizontal)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15){
                        ForEach(data, id: \.self){ data in
                            ZStack(alignment: .bottom){
                                Color("Color")
                                    .frame(height: UIScreen.main.bounds.height / 3)
                                    .cornerRadius(20)

                                VStack{
                                    Image(data.image)
                                        .resizable()
                                        .frame(width: UIScreen.main.bounds.width / 1.7)
                                    HStack(){
                                        VStack(alignment: .leading, spacing: 10){
                                            Text(data.title)
                                            Text("Apple Watch")
                                                .font(.title)
                                                .fontWeight(.bold)
                                        }.foregroundColor(.white)
                                        Spacer()
                                        Button(action: {
                                            self.showDetail.toggle()
                                        }) {
                                            Image(systemName: "plus")
                                                .resizable()
                                                .frame(width: 15, height: 15)
                                                .foregroundColor(.white)
                                                .padding()
                                                .background(Color("Color1"))
                                                .clipShape(Circle())
                                        }
                                    }

                                    .background(Color("Color"))
                                }
                                .padding(.horizontal, 25)
                                .padding(.vertical)
                            }



                        }
                    }
                }
                .padding(.horizontal)
                Spacer()

                HStack{

                    Button(action: {
                        self.tabSelect = 0
                        //print(self.bottom ?? 0)
                    }) {
                        Image(systemName: "suit.heart.fill")
                        .font(.title)
                        .foregroundColor(self.tabSelect == 0 ? .black : Color.black.opacity(0.25))

                        //.background(Color.black)

                    }
                    Spacer()

                    Button(action: {
                        self.tabSelect = 1
                    }) {
                        Image(systemName: "safari")
                        .font(.title)
                        .foregroundColor(self.tabSelect == 1 ? .black : Color.black.opacity(0.25))

                        //.background(Color.black)

                    }
                    Spacer()
                    Button(action: {
                        self.tabSelect = 2
                    }) {
                        Image(systemName: "person")
                        .font(.title)
                        .foregroundColor(self.tabSelect == 2 ? .black : Color.black.opacity(0.25))

                        //.background(Color.black)

                    }

                }
                .padding(.horizontal, 30)
                .padding(.top,25)
                .padding(.bottom,self.bottom == 0 ? 15 : self.bottom)

                .background(Color.white)
            .clipShape(customCurv())


            }

            //.background(Color.white).opacity(0.8)

        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct TopFirstView: View {
    var body: some View {
        HStack{
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image(systemName: "line.horizontal.3.decrease.circle")
                    .resizable()
                    .foregroundColor(Color("Color"))
                    .frame(width: 25, height: 25)
                
            }
            
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image(systemName: "cart")
                    .resizable()
                    .foregroundColor(Color("Color"))

                    .frame(width: 25, height: 25)
                
            }
        }
    }
}

struct TopSeceondView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 10) {
                Text("Welcome!")
                    .foregroundColor(Color("Color"))
                Text("Discover")
                    .font(.title)
                    .fontWeight(.bold)
            }
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .foregroundColor(Color("Color"))
                    .frame(width: 25, height: 25)
                
            }
            
        }
    }
}

var menu = ["ALL","CLASSIC","GRAND","FORMAL","ORIGINAL","TREND"]

struct MiddleFirstView: View {
    @Binding var selectMenu: String
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15){
                ForEach(menu, id: \.self){ menu in
                    Button(action: {
                        self.selectMenu = menu
                    }) {
                        
                        Text(menu)
                            .foregroundColor( self.selectMenu == menu ? Color("Color1") : Color("Color"))
                        
                    }
                    
                }
            }
        }
    }
}


struct Watchs : Identifiable,Hashable{

    var id : Int
    var color : String
    var price : String
    var image : String
    var title : String
}

var data = [

    Watchs(id: 0, color: "Dark Black", price: "$500", image: "black",title: "Classic Black"),
    Watchs(id: 1, color: "Light Yellow", price: "$450", image: "yellow",title: "Classic Yellow"),
    Watchs(id: 2, color: "Rose Gold", price: "$510", image: "gold",title: "Classic Gold"),
    Watchs(id: 3, color: "Red", price: "$500", image: "red",title: "Classic Red"),
    Watchs(id: 4, color: "White", price: "$400", image: "white",title: "Classic White"),
]


struct customCurv: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 45, height: 45))
        
        return Path(path.cgPath)
    }
    
    
}


