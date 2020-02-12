//
//  ContentView.swift
//  Drawing
//
//  Created by Petro Onishchuk on 2/10/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

struct Arc: InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    var inserAmount: CGFloat = 0
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.inserAmount += amount
        return arc
    }
    func path(in rect: CGRect) -> Path {
        let rotationAjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAjustment
        let modifiedEnd = endAngle - rotationAjustment
       
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - inserAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        
        return path
    }
}

struct Flower: Shape {
    
    
    // How much to move this petal away from the center
    var petalOffSet: Double = 100
    
    // How wide to make each petal
    var petaWidth: Double = 100
    
    func path(in rect: CGRect) -> Path {
        // The path that will hold all petals
        var path = Path()
        
        // Count fro 0 up to pi * 2, moving up pi / 8 each time
        for number in stride(from: 0, to: CGFloat.pi * 2, by: CGFloat.pi / 8 ) {
            // rotate the petal by the current value of our loop
            let rotation = CGAffineTransform(rotationAngle: number)
            
            // move the petal to be at the center of our view
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            // create a path for this petal using our properties plus a fixed Y and height
            let originalPetal = Path(ellipseIn: CGRect(x: CGFloat(petalOffSet), y: 0, width: CGFloat(petaWidth), height: rect.width / 2))
            
            // apply our rotation/position transformation to the petal
            let rotatedPetal = originalPetal.applying(position)
            
            // add it to  our main path
            path.addPath(rotatedPetal)
            
        }
        
        // now send the main path back
        return path
    }
}

struct ColorCyclingCircle: View  {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) {
                value in
                Circle()
                .inset(by: CGFloat(value))
                .strokeBorder(LinearGradient(gradient: Gradient(colors: [
                    self.color(for: value, brightness: 1),
                    self.color(for: value, brightness: 0.5)]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
            }
        }
    .drawingGroup()
    }
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps) + self.amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ContentView2: View {
    @State private var amount: CGFloat = 0.0
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color.red)
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color.green)
                .frame(width: 200 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color.blue)
                .frame(width: 200 * amount)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)
            
            
            Slider(value: $amount)
            .padding()
        }.frame( maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
    
    
    }
    
}

// Special effects in SwiftUI blurs, blending, and more

struct ContentView3: View {
    @State private var colorCycle = 0.0
     @State private var amount: CGFloat = 0.0
    
    
    var body: some View {
        VStack {
         Image("dog")
        .resizable()
        .scaledToFit()
        .frame(width: 200, height: 200)
        .saturation(Double(amount))
        .blur(radius: (1 - amount) * 20)
            
            Slider(value: $amount)
            .padding()
        }
    }
    
}


//Day 45. Part 3.Animating simple shapes with animatableData
struct Trapezoid: Shape {
    var insetAmount: CGFloat
    
    var animatableData: CGFloat {
        get { insetAmount }
        set { self.insetAmount = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
    }
}


// Day 45. Part 3. Animating complex shapes with AnimatablePair
struct Checkerboard: Shape {
    var rows: Int
    var columns: Int
    
    public var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(Double(rows), Double(columns))
        }
        
        set {
            self.rows = Int(newValue.first)
            self.columns = Int(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // figure out big each row/column needs to be
        let rowSize = rect.height / CGFloat(rows)
        let columnSize = rect.width / CGFloat(columns)
        
        // loop over all rows and coluns, making alternating squares colored
        for row in 0..<rows {
            for column in 0..<columns {
                if (row + columns).isMultiple(of: 2) {
                    // this square should be colored, add a rectengle here
                    let startX = columnSize * CGFloat(column)
                    let startY = rowSize * CGFloat(row)
                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }
        return path
    }
}

struct ContentView: View {
   @State private var rows = 4
    @State private var columns = 4
    
    
    
    var body: some View {
       Checkerboard(rows: rows, columns: columns)
        .onTapGesture {
            withAnimation(.linear(duration: 3)) {
                self.rows = 8
                self.columns = 16
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
