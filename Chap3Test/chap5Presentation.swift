//
//  chap5Presentation.swift
//  Chap3Test
//
//  Created by 이연희 on 1/3/21.
//  Copyright © 2021 이연희. All rights reserved.
//

import SwiftUI

struct chap5Presentation: View {
    var body: some View {
        PopoverTest()
    }
}
struct PopoverTest:View{
    @State var showingPopover=false
    var body: some View{
        VStack{
            Button(action:{
                self.showingPopover.toggle()
            }){
                Text("Popover Button").font(.largeTitle)
            }
        }.popover(isPresented: $showingPopover,
                  attachmentAnchor: .rect(.bounds),
                  arrowEdge: .top,
                  content: popoverContents
        )
    }
    func popoverContents() -> some View{
        VStack(alignment:.leading){
            HStack{
                Button(action:{
                    self.showingPopover=false
                }){
                    Text("cancel").foregroundColor(.red)
                }
                Spacer()
                Text("new event").font(.headline)
                Spacer()
                Button("ADD(+)"){}
            }
            Divider().padding(.bottom)
            Text("Title")
            TextField("main",text: .constant(""))
            Text("Contents")
            TextField("content",text: .constant(""))
            Spacer()

        }.padding()
    }}

struct usingBinding:View{
    @Binding var isPresented:Bool
     @State private var showingSheet = false
    var body: some View {
          Button(action: {
              self.isPresented = false
          }){
              Text("Present Test").font(.title).foregroundColor(.blue)
          }.sheet(isPresented: $showingSheet,
                  onDismiss: {print("Dismissed")},
                  content: {PresentedView()})
      }
}
struct PresentationTest {
       @State private var showingSheet = false
   var body: some View {
       Button(action: {
           self.showingSheet.toggle()
       }){
           Text("Present Test").font(.title).foregroundColor(.blue)
       }.sheet(isPresented: $showingSheet,
               onDismiss: {print("Dismissed")},
               content: {PresentedView()})
   }
}

struct PresentedView: View{
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
        Button(action:{
            if self.presentationMode.wrappedValue.isPresented{
                self.presentationMode.wrappedValue.dismiss()
            }
        }){
            Text("Tap to Dismiss")
                .font(.title).foregroundColor(.red)
        }
    }
}
struct chap5Presentation_Previews: PreviewProvider {
    static var previews: some View {
        chap5Presentation()
    }
}
