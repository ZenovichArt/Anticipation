//
//  ContentView.swift
//  Anticipation
//
//  Created by Artem Zenovich on 30.07.2020.
//  Copyright © 2020 Artem Zenovich. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var anticipation: String
    @State var date: Date
    @State var isReady: Bool
    @State var inSeconds: Int
    @State var inMinutes: Int
    @State var inHours: Int
    @State var inDays: Int
    
    private let defaults = UserDefaults.standard
    
    func getStringFromDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E, d MMM y"
        return formatter.string(from: self.date)
    }
    
    func save() {
        UserDefaults.standard.set(anticipation, forKey: "Anticipation")
        UserDefaults.standard.set(date, forKey: "Date")
    }
    
    func load() {
        anticipation = UserDefaults.standard.string(forKey: "Anticipation") ?? ""
        if (UserDefaults.standard.object(forKey: "Date") != nil) {
            date = UserDefaults.standard.object(forKey: "Date") as! Date
        }
    }
    
    
    
    var body: some View {
        
        
        VStack (spacing: 20) {
            
            if isReady {
                
                Text("Your anticipation is:")
                    .scaleEffect(1.3)
                
                Text(anticipation)
                    .padding(50)
                    .scaleEffect(1.5)
                    .background(Color.blue.opacity(0.5))
                    .cornerRadius(20)
                
                HStack {
                    Text("It will happen on ")
                    
                    Text(getStringFromDate())
                }
                
                VStack (spacing: 20){
                    Text("You still need to wait for")
                    
                    Text(String(inSeconds) + " seconds")
                        .scaleEffect(1.5)
                        .padding(30)
                        .background(Color.blue.opacity(0.5))
                        .cornerRadius(20)
                    
                    Text(String(inMinutes) + " minutes")
                        .scaleEffect(1.5)
                        .padding(30)
                        .background(Color.blue.opacity(0.5))
                        .cornerRadius(20)
                    
                    Text(String(inHours) + " hours")
                        .scaleEffect(1.5)
                        .padding(30)
                        .background(Color.blue.opacity(0.5))
                        .cornerRadius(20)
                    
                    Text(String(inDays) + " days")
                        .scaleEffect(1.5)
                        .padding(30)
                        .background(Color.blue.opacity(0.5))
                        .cornerRadius(20)
                }
                
                HStack (spacing: 100) {
                    
                    Button(action: {
                        self.isReady = false
                    }) {
                        Image(systemName: "plus.app.fill")
                            .foregroundColor(.green)
                            .scaleEffect(2)
                        
                    }
                    
                    Button(action: {
                        self.inSeconds = Int(self.date.timeIntervalSinceNow)
                        self.inMinutes = Int(self.inSeconds/60)
                        self.inHours = Int(self.inMinutes/60)
                        self.inDays = Int(self.inHours/24)
                    }) {
                        Image(systemName: "arrow.counterclockwise.circle.fill")
                            .foregroundColor(.green)
                            .scaleEffect(2)
                        
                    }
                }
                
                
            }
            else {
                
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
                        self.inSeconds = Int(self.date.timeIntervalSinceNow)
                        self.inMinutes = Int(self.inSeconds/60)
                        self.inHours = Int(self.inMinutes/60)
                        self.inDays = Int(self.inHours/24)
                        self.save()
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
            
            
        }
        .background(Image("AnticipationBackground"))
        .onAppear(perform: load)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(anticipation: "", date: Date(), isReady: true, inSeconds: 10, inMinutes: 10, inHours: 1, inDays: 0)
        
    }
}
