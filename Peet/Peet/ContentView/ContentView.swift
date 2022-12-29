//
//  ContentView.swift
//  Peet
//
//  Created by Eddy on 12/28/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = viewModel()
    private let timer = Timer.publish(every: 15, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        Form {
            Section("Your peet") {
                TextField("¡Name your peet!", text: $vm.pet.name, onCommit:  {
                    resignFirstResponder()
                })
                
//                Image(vm.pet.happy == "Drown in tears" ? "Sadpeet" : "Happypeet")
                if (vm.pet.happy == "😎") {
                    Image("Happypeet")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .centerH()
                }

                else if (vm.pet.happy == "😐"){
                    Image("Sadpeet")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .centerH()
                }

                else {
                    Image("Ssadpeet")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .centerH()
                }
                
                Text("Age : **\(vm.pet.age)** minutes")
                Text("mood : **\(vm.pet.happy)**")
                Text("🥪 : **\(vm.pet.hunger)**")
                Text("💦 : **\(vm.pet.thirst)**")
            }
            Section("What you gonna do") {
                Button("Feed a peanut butter and jelly sandwich", action: vm.feed)
                Button("Give a cup of delicious water", action: vm.giveWater)
            }
        }
        .onReceive(timer) {_ in
            vm.saveData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
