//
//  chap3Frame~Layout.swift
//  Chap3Test
//
//  Created by 이연희 on 1/2/21.
//  Copyright © 2021 이연희. All rights reserved.
//

import SwiftUI

struct chap3Frame_Layout: View {
    var body: some View {
        
        //FrameAlignmentTest()
        //MinMaxSizeTest()
        //fixedSizeTest1()
        //fixedSizeTest2()
        LayoutPriorityTest()
    }
}

struct FrameAlignmentTest: View{
    var body: some View{
        HStack{
            Text("frame").background(Color.yellow)
                .frame(width:100,height: 100,alignment: .leading)
                .border(Color.red)
            
            Text("frame").background(Color.gray)
                .frame(width:100,height: 100)
                .border(Color.red)
            
            Text("frame").background(Color.blue)
                .frame(width:100,height: 100, alignment: .trailing)
                .border(Color.red)
        }
    }
}

struct MinMaxSizeTest: View{
    var body: some View{
        HStack{
            //minWidth vs maxWidth
            Rectangle().fill(Color.red).frame(minWidth:100)
            Rectangle().fill(Color.orange).frame(maxWidth:15)
            
            //height vs maxHeight
            Rectangle().fill(Color.yellow).frame(height:150)
            Rectangle().fill(Color.green).frame(maxHeight: .infinity)
            
            //.infinity
            Rectangle().fill(Color.blue).frame(maxWidth:.infinity, maxHeight: .infinity)
            Rectangle().fill(Color.purple)
            
        }.frame(width:300, height:150)
        
    }
}
struct fixedSizeTest1: View{
    var body: some View{
        VStack{
            //fixedSize not apply
            Text("frame modifier1").font(.title).bold().frame(width:80, height:30)
            Rectangle()
            Color.red
            Image(systemName: "heart").resizable()
            //fixedSize apply
            Text("frame modifier2").font(.title).bold().frame(width:80,height:30).fixedSize()
            Rectangle().fixedSize()
            Color.red.fixedSize()
            Image(systemName: "heart").resizable().fixedSize()
        }
    }
}

struct fixedSizeTest2 {
    var body:some View{
        VStack(spacing:100){
            Group{
                Text("if apply FixedSize(), not skip text")
                
                Text("if apply FixedSize(), not skip text")
                    .font(.title).fixedSize(horizontal: true, vertical: false)
                
                Text("if apply FixedSize(), not skip text").font(.title).fixedSize(horizontal: false, vertical: true)
                
            }.font(.title)
                .frame(width:150, height: 40)
        }    }
}

struct LayoutPriorityTest: View{
    var body: some View{
        VStack(spacing:20){
            HStack{//not apply priority
                Color.red
                Color.green
                Color.blue
            }.frame(height:40)
            
            HStack{//change priority
                Color.red.layoutPriority(1)
                Color.green
                Color.blue.layoutPriority(1)
            }.frame(height:40)
            
            HStack{
                Color.red.layoutPriority(1)
                Color.green.frame(minWidth:30)
                Color.blue.frame(maxWidth:50).layoutPriority(1)
            }.frame(height:40)
            
            HStack{
                Color.red.frame(width:50)
                Color.green.layoutPriority(1)
                Color.blue.frame(maxWidth:50).layoutPriority(1)
            }.frame(height:40)
            
        }    }
}
struct chap3Frame_Layout_Previews: PreviewProvider {
    static var previews: some View {
        chap3Frame_Layout()
    }
}
