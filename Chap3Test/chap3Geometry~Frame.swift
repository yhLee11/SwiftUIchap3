//
//  chap3Geometry~Frame.swift
//  Chap3Test
//
//  Created by 이연희 on 1/2/21.
//  Copyright © 2021 이연희. All rights reserved.
//

import SwiftUI

struct chap3Geometry_Frame: View {
    var body: some View {
        //Frame
        HStack{
            Rectangle().fill(Color.yellow).frame(width:30)
            
            VStack{
                Rectangle().fill(Color.blue).frame(height:200)
                
                GeometryReader{
                    contents(geometry:$0)
                }
                .background(Color.green)
                .border(Color.red, width:4)
            }
            .coordinateSpace(name:"VStackCS")
        }
        .coordinateSpace(name:"HStackCS")
        
    }
}

func contents(geometry g: GeometryProxy)->some View{
    VStack{
        Text("Local").bold()
        Text(stringFormat(for: g.frame(in: .local).origin))
            .padding(.bottom)
        
        Text("Global").bold()
        Text(stringFormat(for: g.frame(in: .global).origin))
            .padding(.bottom)
        
        Text("NamedVStackCS").bold()
        Text(stringFormat(for: g.frame(in: .named("VStackCS")).origin))
            .padding(.bottom)
        
        Text("NamedHStackCS").bold()
        Text(stringFormat(for: g.frame(in: .named("HStackCS")).origin))
            
        
    
    }
}

func stringFormat(for point:  CGPoint)-> String{
    String(format: "x: %.f, y: %.f", arguments: [point.x, point.y])
}

struct GeometryTest: View{
    var body: some View{
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

struct chap3Geometry_Frame_Previews: PreviewProvider {
    static var previews: some View {
        chap3Geometry_Frame()
    }
}
