//
//  Content_ViewModel.swift
//  Peet
//
//  Created by Eddy on 12/28/22.
//

import Foundation
import SwiftUI

extension ContentView {
    class viewModel: ObservableObject {
        @Published var pet: Pet
        private var repository = PetRepository()
        
        init() {
            pet = repository.loadData()
        }
        
        func saveData() {
            objectWillChange.send()
            repository.saveData(pet: pet)
        }
        
        func feed() {
            pet.lastMeal = Date()
            saveData()
        }
        
        func giveWater() {
            pet.lastDrink = Date()
            saveData()
        }
    }
}
