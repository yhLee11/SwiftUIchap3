//
//  ContentView.swift
//  Chap3Test
//
//  Created by 이연희 on 1/1/21.
//  Copyright © 2021 이연희. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader{ geometry in
            Text("Geometry Reader")
                .font(.largeTitle).bold()
                .position(x: geometry.size.width/2, y:geometry.safeAreaInsets.top)
               
            
            VStack{
                Text("Size").bold()
                Text("width: \(Int(geometry.size.width))")
                Text("height: \(Int(geometry.size.height))")
                
            }
            .position(x: geometry.size.width/2, y: geometry.size.height/2.5)

            VStack{
                Text("SafeAreaInsets").bold()
                Text("top: \(Int(geometry.safeAreaInsets.top))")
                Text("botton: \(Int(geometry.safeAreaInsets.bottom))")
            }
            .position(x:geometry.size.width/2,y: geometry.size.height/1.4)
        }.font(.title)
            .frame(height: 500)
            .border(Color.green,width: 5)
        
        
    }
}

struct ListStyleTest: View{
      let fruits = ["apple","banana","blueberry","mango"]
      let drinks = ["water", "coke", "milk"]
      var body: some View {
          
          let titles = ["Fruits", "Drinks"]
          let data = [fruits,drinks]
          
          return List{
              ForEach(data.indices){ index in
                  Section(
                      header: Text(titles[index]).font(.title),
                      footer: HStack{ Spacer(); Text("\(data[index].count)")}
                  ){
                      ForEach(data[index],id: \.self){
                          Text($0)
                      }
                  }
              }
          }.listStyle(GroupedListStyle())
              .environment(\.horizontalSizeClass,.regular)
          
          
          
          
      }}

struct SectionTest: View{
    let fruits = ["apple","banana","blueberry","mango"]
    let drinks = ["water", "coke", "milk"]
    var body: some View {
        
        let titles = ["Fruits", "Drinks"]
        let data = [fruits,drinks]
        
        return List{
            ForEach(data.indices){ index in
                Section(
                    header: Text(titles[index]).font(.title),
                    footer: HStack{ Spacer(); Text("\(data[index].count)")}
                ){
                    ForEach(data[index],id: \.self){
                        Text($0)
                    }
                }
            }
        }
        
    }
}
struct listTest: View{
    let fruits = ["apple","banana","blueberry","mango"]
    let drinks = ["water", "coke", "milk"]
    var body: some View{
        List{
            ForEach(0..<3){
                Text("\($0)")
            }
            
            Text("Fruits").font(.largeTitle)
            ForEach(fruits,id: \.self){
                Text($0)
            }
            
            Text("Drinks").font(.largeTitle)
            ForEach(drinks,id: \.self){
                Text($0)
            }
        }    }
    
}

struct navigationViewStyleTest: View {
    var body: some View{
        NavigationView{
            VStack(spacing:20){
                NavigationLink(destination: Text("detail view area").font(.largeTitle)){
                    Text("master view 1").font(.title)
                    
                }
                NavigationLink(destination:Text("detail view area").font(.largeTitle)){
                    Text("master view 2").font(.title)
                }
            }.navigationBarTitle("navigation view style")
            Text("detail view").font(.largeTitle)
        }.navigationViewStyle(StackNavigationViewStyle())//not use SplitViewController UI
        
    }
}


struct navigationTest: View{
    
    var body: some View{
        let destination = Text("DESTINATION").navigationBarHidden(true)
        
        return NavigationView{
            NavigationLink(destination: destination){
                
                Image(systemName: "bell")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width:50,height: 50)
                
            }
            .navigationBarTitle("navigation bar hidden")
            //.navigationBarBackButtonHidden(true)
            //.navigationBarHidden(true)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
