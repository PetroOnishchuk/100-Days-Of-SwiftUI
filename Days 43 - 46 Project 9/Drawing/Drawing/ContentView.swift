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
    
    var insertAmount: CGFloat = 0
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insertAmount += amount
        return arc
    }
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
       
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insertAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        
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

// Day 45 //Special effects in SwiftUI: blurs, blending, and more

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

//Day 45 Special effects in SwiftUI blurs, blending, and more

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


// Day 45. Creating a spinograph  with SwiftUI

struct Spirograph: Shape {
    let innerRadius: Int
    let outerRadius: Int
    let distance: Int
    let amount: CGFloat
    
    func gcd(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        
        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }
        return a
    }
    
    func path(in rect: CGRect) -> Path {
        let division = gcd(innerRadius, outerRadius)
        let outerRadius = CGFloat(self.outerRadius)
        let innerRadius = CGFloat(self.innerRadius)
        let distance = CGFloat(self.distance)
        let difference = innerRadius - outerRadius
        let endPoint = ceil(2 * CGFloat.pi * outerRadius / CGFloat(division)) * amount
        
        var path = Path()
        
        for theta in stride(from: 0, through: endPoint, by: 0.01) {
            var x = difference * cos(theta) + distance * cos(difference / outerRadius * theta)
            var y = difference * sin(theta) - distance * sin(difference / outerRadius * theta)
            
            x += rect.width / 2
            y += rect.height / 2
            
            if theta == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        return path
    }
}


// Day 45. Creating a Spirograph  with SwiftUI
struct ContentView4: View {
    @State private var innerRadius = 125.0
    @State private var otherRadius = 75.0
    @State private var distance = 25.0
    @State private var amount: CGFloat = 1.0
    @State private var hue = 0.6
    
    
 
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            Spirograph(innerRadius: Int(innerRadius), outerRadius: Int(otherRadius), distance: Int(distance), amount: amount)
            .stroke(Color(hue: hue, saturation: 1, brightness: 1), lineWidth: 1)
                .frame(width: 300, height: 300)
            
            Spacer()
            
            Group {
                Text("Inner radius: \(Int(innerRadius))")
                Slider(value: $innerRadius, in: 10...150, step: 1)
                    .padding([.horizontal, .bottom])
                
                Text("Outer radius: \(Int(otherRadius))")
                Slider(value: $otherRadius, in: 10...150, step: 1)
                .padding([.horizontal, .bottom])
                
                Text("Distance: \(Int(distance))")
                         Slider(value: $distance, in: 10...150, step: 1)
                         .padding([.horizontal, .bottom])
                
                Text("Amount: \(amount, specifier: "%.2f")")
                         Slider(value: $amount)
                         .padding([.horizontal, .bottom])
                
                Text("Color")
                Slider(value: $hue)
                    .padding(.horizontal)
            }
        }
    }
    
}


// Day 46. Challenge 1.Create an Arrow shape made from a rectangle and a triangle – having it point straight up is fine.


// Day 46. Challenge 2. Make the line thinckness of your Arrow shape


struct Arrow: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY / 4))
        path.addLine(to: CGPoint(x: rect.maxX / 3, y: rect.maxY / 4))
        path.addLine(to: CGPoint(x: rect.maxX / 3, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX / 1.5, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX / 1.5, y: rect.maxY / 4))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY / 4))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}


// Day 46. Challenge 3. Create a ColorCyclingRectangle shape that is the rectangular cousin of ColorCyclingCircle, allowing us to control the position of the gradient using a property.


struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) {
                value in
                Rectangle()
                .inset(by: CGFloat(value))
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [self.color(for: value, brightness: 1),
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


struct ContentView: View {
    @State private var lineWidth = 5.0
    @State private var isShowBoldLine = false
    @State private var colorCycle = 0.0
    
    var body: some View {
        NavigationView {
            VStack {
                Arrow()
                    .stroke(Color.red, style: StrokeStyle(lineWidth: CGFloat(self.isShowBoldLine ? 20.0 : self.lineWidth), lineCap: .round, lineJoin: .round))
                    .frame(width: 150, height: 350)
                    .onTapGesture {
                        withAnimation {
                            self.isShowBoldLine.toggle()
                        }
                }
                .padding(.bottom, 50)
                
                ColorCyclingRectangle(amount: self.colorCycle)
                    .frame(width: 300, height: 300)
                
                Slider(value: $colorCycle)
                    .padding(.bottom, 50)
               
                
                
            }
            
        }
        
    }
    
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
