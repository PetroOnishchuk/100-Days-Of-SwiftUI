//
//  BucketListView.swift
//  BucketList
//
//  Created by Petro Onishchuk on 3/13/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI
import MapKit


struct BucketListView: View {
    @State private var centerCoordinate = CLLocationCoordinate2D()
    var body: some View {
        ZStack {
            MapView(centerCoordinate:  $centerCoordinate)
                .edgesIgnoringSafeArea(.all)
            Circle()
                .fill(Color.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        // create a new location
                    }) {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(Color.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                }
            }
        }
    }
}

struct BucketListView_Previews: PreviewProvider {
    static var previews: some View {
        BucketListView()
    }
}
