//
//  ResponseView.swift
//  Jokes
//
//  Created by meera uae on 29/07/2023.
//

import SwiftUI

struct Responseveiw: View {
    var isPostivie: Bool
    var body: some View {
        VStack {
            Image(isPostivie ? "happy":"sad")
                .resizable()
                .scaledToFit()
            Text(isPostivie ? "i am happy to hear that":"i will make sure to improve it")
                .font(.subheadline)
        }
    }
}

struct responseveiw_Previews: PreviewProvider {
    static var previews: some View {
        Responseveiw(isPostivie: true)
        Responseveiw(isPostivie: false)
        
        
    }
}
