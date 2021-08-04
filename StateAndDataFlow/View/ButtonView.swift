//
//  ButtonView.swift
//  StateAndDataFlow
//
//  Created by Алексей on 04.08.2021.
//

import SwiftUI

struct ButtonView: View {
    var title: String
    var function:() -> Void

    
    var body: some View {
        Button(
            action: { function() },
            label: {
                Text("\(title)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
            }
        )
        .frame(width: 200, height: 60)
        .background(Color.red)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                .stroke(Color.black, lineWidth: 4)
        )
        .padding()
    }
}

