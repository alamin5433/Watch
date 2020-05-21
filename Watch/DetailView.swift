//
//  DetailView.swift
//  Watch
//
//  Created by Al Amin on 21/5/20.
//  Copyright © 2020 Al Amin. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @State private var txt = ""
    @State private var btnClick = 0
    @Binding var showDetail: Bool
    var datailData : Watchs = data[0]
    var bottom = UIApplication.shared.windows.first?.safeAreaInsets.bottom
    var body: some View {
        ZStack{
            Color("Color").edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                            .resizable()
                            .foregroundColor(Color.white.opacity(0.6))
                            .frame(width: 25, height: 25)
                        
                    }
                    
                    Spacer()
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image(systemName: "cart")
                            .resizable()
                            .foregroundColor(Color.white.opacity(0.6))
                            
                            .frame(width: 25, height: 25)
                        
                    }
                }
                .padding(.vertical)
                
                HStack(spacing: 15){
                    Image(systemName: "magnifyingglass")
                        .font(.title)
                        .foregroundColor(.gray)
                    
                    TextField("Want to search anything?", text: self.$txt)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .padding(.horizontal)
                
                HStack{
                    VStack(alignment: .leading, spacing: 10) {
                        Text(self.datailData.title)
                        Text("Apple watch Series 5")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.white)
                    Spacer()
                }
                .padding(.vertical)
                .padding(.horizontal)
                
                HStack{
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Color")
                            .foregroundColor(Color.white.opacity(0.6))
                        Text(self.datailData.color)
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                        Text("price")
                        .foregroundColor(Color.white.opacity(0.6))
                            .padding(.top)
                        Text(self.datailData.price)
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.white)
                    }
                  //  .padding(.bottom, 50)
                  //  .offset( y: -50)
                    Spacer(minLength: 0)
                    Image(self.datailData.image)
                    .resizable()
                        .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 2.5)
                        .rotationEffect(.init(degrees: 10))
                }
                .padding(.bottom, -60)
                .zIndex(1)
                .padding(.horizontal)
                ZStack(alignment:.topLeading) {
                    VStack {
                        ScrollView(UIScreen.main.bounds.height < 750 ? .vertical : .init(), showsIndicators: false) {
                            VStack{
                                HStack(spacing: 15){
                                    Button(action: {
                                        self.btnClick = 0
                                    }) {
                                        Text("Detail")
                                            .foregroundColor(self.btnClick == 0 ?.white : .gray)
                                            .padding(.horizontal, 20)
                                            .padding(.vertical, 10)
                                            .background(self.btnClick == 0 ? Color("Color1") : Color.clear)
                                            .cornerRadius(8)
                                    }
                                    Button(action: {
                                        self.btnClick = 1
                                    }) {
                                        Text("Description")
                                            .foregroundColor(self.btnClick == 1 ?.white : .gray)
                                            .padding(.horizontal, 15)
                                            .padding(.vertical, 10)
                                            .background(self.btnClick == 1 ? Color("Color1") : Color.clear)
                                            .cornerRadius(8)
                                    }
                                    Spacer()
                                }
                                 
                                HStack(spacing: 25){
                                    VStack(spacing: 8){
                                        Text("15mm")
                                            .foregroundColor(.black)
                                            .fontWeight(.bold)
                                            .font(.title)
                                        
                                        Text("stop watch")
                                            .foregroundColor(.gray)
                                    }
                                    VStack(spacing: 8){
                                        Text("Leath")
                                            .foregroundColor(.black)
                                            .fontWeight(.bold)
                                            .font(.title)
                                        
                                        Text("stop watch")
                                            .foregroundColor(.gray)
                                    }
                                    
                                    VStack(spacing: 8){
                                        Text("50mm")
                                            .foregroundColor(.black)
                                            .fontWeight(.bold)
                                            .font(.title)
                                        
                                        Text("water reset")
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding(.top)
                               
                            }
                             .padding(.horizontal,25)
                        }
                        .padding(.top,50)
                        HStack{
                            Button(action: {
                                print(self.bottom!)
                            }) {
                                Text("Add to Cart")
                                    
                                    .foregroundColor(.white)
                                    .frame(width: UIScreen.main.bounds.width / 1.6)
                                    .padding()
                                    .background(Color("Color1"))
                                    .cornerRadius(8)
                                    .shadow(radius: 5)
                                
                            }
                            
                            
                            Spacer()
                            Button(action: {
                                self.showDetail.toggle()
                            }) {
                                Image(systemName: "multiply")
                                    .font(.title)
                                    .foregroundColor(.gray)
                            }
                            .padding(.trailing)
                            
                        }
                        .padding(.horizontal)
                        .padding(.bottom,self.bottom! == 0 ? 15 : self.bottom)
                        
                    }
                    .background(Color.white)
                   // .clipShape(customCurv())
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image(systemName: "plus")
                            
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("Color1"))
                            .clipShape(Circle())
                            .padding(.leading, 30)
                        .offset( y: -25)
                    }
            
                }
                
                
                
               // Spacer()
            }
           // .padding(.horizontal)
            
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(showDetail: true)
//    }
//}
