//
//  Pet-Repository.swift
//  Peet
//
//  Created by Eddy on 12/28/22.
//

import Foundation

class PetRepository {
    private var PET_KEY = "PEET"
    private var pet: Pet
    
    init() {
        if let data = UserDefaults.standard.data(forKey: PET_KEY) {
            if let decoded = try? JSONDecoder().decode(Pet.self, from: data) {
                self.pet = decoded
                print("Peet data successfully retrieved")
                return
            }
        }
        self.pet = Pet(name: "shirnaba", lastMeal: Date(), lastDrink: Date())
    }
    
    func loadData() -> Pet {
        return self.pet
    }
    
    func saveData(pet: Pet) {
        if let encoded = try? JSONEncoder().encode(pet) {
            UserDefaults.standard.set(encoded, forKey: PET_KEY)
            print("Data saved at: \(Date().formatted(date: .omitted, time: .standard))")
        }
    }
}
