//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Petro Onishchuk on 2/19/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image("cupcakes")
                    .resizable()
                    .scaledToFit()
                        .frame(width: geo.size.width)
                    
                    Text("You total is \(self.order.cost, specifier: "%.2f")")
                        .font(.title)
                    
                    Button("Place Order") {
                        self.placeOrder()
                    }
                .padding()
                }
           
            }
        }
        .navigationBarTitle("Check out", displayMode: .inline)
        .alert(isPresented: $showingConfirmation) { () -> Alert in
            Alert(title: Text("Thank you!"), message: Text(confirmationMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    
    func placeOrder() {
        // 1. Convert our current order object into some JSON data that can be sent.
        
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        // 2. Prepare a URLRequest to send our encoded data as JSON.
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        // 3. Run that request and process the response.
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            // handle the result here.
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error"). ")
                return
            }
            print("\(String(data: data, encoding: .utf8))")
            if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
                self.confirmationMessage = "Your order for \(decodedOrder.quantity)X \(Order.types[decodedOrder.type].lowercased()) cupcakes in on its way!"
                self.showingConfirmation = true
            } else {
                print("Invalid response from server")
            }
        }.resume()
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
