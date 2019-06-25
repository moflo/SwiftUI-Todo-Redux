//
//  FormButtons
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import Combine
import SwiftUI

// Class to respond to editText commit, change responder / focus

struct FieldSetText: View {
    @Binding var textItem: String
    var label: String
    var placeHolder: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.headline)
            TextField($textItem, placeholder: Text(placeHolder))
                .padding(.all)
                .background(Color("form-field-background"), cornerRadius: 5.0)
        }
        .padding(.horizontal, 15)
    }
}

struct RoundedButton: View {
    var body: some View {
        Button(action: {}) {
            HStack {
                Spacer()
                Text("Save")
                    .font(.headline)
                    .color(Color.white)
                Spacer()
            }
        }
        .padding(.vertical, 10.0)
        .background(Color.green, cornerRadius: 8.0)
        .padding(.horizontal, 40)
    }
}

struct NotificationBadge : View {
    let text: String
    let color: Color
    @Binding var show: Bool
    
    var animation: Animation {
        Animation
            .spring(initialVelocity: 5)
            .speed(2)
    }
    
    var body: some View {
        Text(text)
            .color(.white)
            .padding()
            .background(color)
            .cornerRadius(8)
            .scaleEffect(show ? 1: 0.5)
            .opacity(show ? 1 : 0)
            .animation(animation)
    }
}