//
//  Helpers.swift
//  Peet
//
//  Created by Eddy on 12/28/22.
//

import Foundation
import SwiftUI

func calcTimeSince(data: Date) -> Int {
    let mins = Int(-data.timeIntervalSinceNow) / 60
    return mins
}

func resignFirstResponder() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
}

extension View {
    func centerH() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
}
