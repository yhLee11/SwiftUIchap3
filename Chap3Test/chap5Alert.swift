//
//  chap5Alert.swift
//  Chap3Test
//
//  Created by 이연희 on 1/3/21.
//  Copyright © 2021 이연희. All rights reserved.
//

import SwiftUI

struct chap5Alert: View {
    var body: some View{
        //AlertTest()
        ActionSheetTest()
    }
}

struct ActionSheetTest:View{
    @State private var showingActionSheet = false
    var body: some View{
        Button(action: {
            self.showingActionSheet = true
        }){
            Text("ActionSheet")
        }.actionSheet(isPresented: $showingActionSheet){
            ActionSheet(title: Text("hello"),
                        message: Text("content"),
                        buttons:[
                            .default(Text("button1")),
                            .default(Text("button2")),
                            .destructive(Text("button3")),
                            .cancel(Text("cancel"))
            ])
        }
    }
}


struct AlertTest: View{
    @State private var showingAlert = false
    var body: some View{
        Button(action: {
            self.showingAlert = true
        }){
            Text("Alert Test")
        }.alert(isPresented: $showingAlert){
            Alert(
                title: Text("hello"),
                message: Text("content"),
                primaryButton: .default(Text("ok"),action:{print("ok")}),
                secondaryButton: .cancel(Text("cancel"))
            )
        }
        
    }
}


struct chap5Alert_Previews: PreviewProvider {
    static var previews: some View {
        chap5Alert()
    }
}
