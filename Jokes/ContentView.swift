//
//  ContentView.swift
//  Jokes
//
//  Created by meera uae on 29/07/2023.
//

import SwiftUI
struct ContentView: View {
    var jokes = [
        joke(setup: "Why couldn't the bicycle stand up?", punchline: "It was two tired!"),
        joke(setup: "Why did the chicken cross the road?",
             punchline: "To get to the other side!"),
        joke(setup: "Is this pool safe for diving?",
             punchline: "It deep ends"),
        joke(setup: "Did you hear about the cheese factory that exploded in France?",
             punchline: "There was nothing left but de Brie"),
        joke(setup: "Dad, can you put my shoes on?",
             punchline: "I don’t think they'll fit me")
    ]
    
    @State private var showPunchLine = false
    @State private var currenIndex = 0
    @State private var isFeedback = false
    @State private var displaySheet = false
    @State private var isPositive = true
    
    @State private var punchLineSize = 0.1
    @State private var tapToContinue = 100.0
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .onTapGesture {
                    if showPunchLine {
                        currenIndex += 1
                        showPunchLine = false
                        isFeedback = true
                    }
                }
            VStack {
                Text(jokes[currenIndex % jokes.count].setup)
                    .padding()
                    .font(.title)
                    .multilineTextAlignment(.center)
                
                Button {
                    print("tap here")
                    withAnimation {
                        showPunchLine = true
                    }
                } label: {
                    Text("what? tell me!!")
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(40)
                }
                .padding()
                
                if showPunchLine {
                    Text(jokes[currenIndex % jokes.count].punchline)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding()
                        .scaleEffect(punchLineSize)
                        .onAppear {
                            withAnimation(.easeOut(duration: 2)) {
                                punchLineSize = 1
                                tapToContinue = 0
                            }
                            
                        }

                    Text("tap to continue")
                        .font(.headline)
                        .italic()
                        .padding()
                        .offset(y: tapToContinue)
                    
                }
                
            }
            .padding()
        }
        .alert("did you like the last joke", isPresented: $isFeedback) {
            Button ("🥰") {
                print("nice!")
                displaySheet = true
                isPositive = true
                
            }
            Button ("😔") {
                print("I will work to improve it")
                displaySheet = true
                isPositive = false
                
            }
        }
        .sheet(isPresented: $displaySheet) {
            Responseveiw(isPostivie: isPositive)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
