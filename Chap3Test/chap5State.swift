//
//  chap5State.swift
//  Chap3Test
//
//  Created by 이연희 on 1/3/21.
//  Copyright © 2021 이연희. All rights reserved.
//

import SwiftUI

struct chap5State: View {
    @ObservedObject var user:User
    
    var body: some View {
        VStack(spacing:30){
            
            Text(user.name)
            Button(action:{self.user.score+=1}){
                Text(user.score.description)
            }
        }
    }
}
class User:ObservableObject{
    let name = "User Name"
    @Published var score = 0
}
struct chap5State_Previews: PreviewProvider {
    static var previews: some View {
        chap5State(user:User())
    }
}
