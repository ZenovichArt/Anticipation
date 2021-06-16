//
//  SetAnticipation.swift
//  Anticipation
//
//  Created by Artem Zenovich on 31.07.2020.
//  Copyright © 2020 Artem Zenovich. All rights reserved.
//

import SwiftUI

struct SetAnticipation: View {
    
    @Binding var anticipation:String
    @Binding var date:Date
    @Binding var isReady:Bool
    
    var body: some View {
        HStack {
            VStack {
                
                Spacer()

                    VStack {
                        Text("Enter your anticipation:")
                            .font(.title)
                            .multilineTextAlignment(.center)
                        TextField("...", text: $anticipation).background(Color.white)
                    }
                    
                .padding()
                Spacer()
                
                DatePicker(selection: $date, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
                
                Spacer()
                
                Button(action: {
                    self.isReady = true
                }) {
                    Text("Ready")
                        .font(.largeTitle)
                        .foregroundColor(Color.black)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(30)
                }
                
                Spacer()
            }
        }
    .background(Image("AnticipationBackground"))
    }
}

struct SetAnticipation_Previews: PreviewProvider {
    static var previews: some View {
        SetAnticipation(anticipation: Binding.constant("Meeting"), date: Binding.constant(Date()), isReady: Binding.constant(false))
    }
}
