//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Petro Onishchuk on 1/21/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI


// MARk: CapsuleText View
struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            //.foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
    }
}


//MARK: Custom modefiers

struct Title: ViewModifier {
    
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
        .padding()
            .background((Color.blue))
        .clipShape(RoundedRectangle(cornerRadius: 10))
            
    }
}
// MARK: Struct Watermark

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        GridStack(rows: 4, columns: 4) { row, col in
          //  HStack {
            Image(systemName: "\(row * 4 + col).circle")
                Text("R:\(row) C \(col)")}
      //  }
    }
}

// MARK: GridStack
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0 ..< rows) {
                row in
                HStack {
                    ForEach(0 ..< self.columns) {
                        column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}








struct ContentView: View {
    

    var body: some View {
        
        GridStack(rows: 4, columns: 4) { row, col in
            Image(systemName: "\(row * 4 + col).circle")
            Text("R:\(row) C \(col)")
            
        }
    
        }
    
     
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}









// MARK: extension View
extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
    
    
}
