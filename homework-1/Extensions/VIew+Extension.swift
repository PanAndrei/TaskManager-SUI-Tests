//
//  VIew+Extension.swift
//  homework-1
//
//  Created by Andrei Panasenko on 29.05.2022.
//

import SwiftUI

extension View {
    func getBackground() -> some View {
        self.padding()
            .background(Color.white)
            .cornerRadius(16)
    }
}
