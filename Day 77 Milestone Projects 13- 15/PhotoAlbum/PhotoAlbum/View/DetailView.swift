//
//  DetailView.swift
//  PhotoAlbum
//
//  Created by Petro Onishchuk on 3/26/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    @State private var picture:  Picture
    @State private var image: Image
    
    var body: some View {
        VStack {
           image
        }
        .onAppear {
            
        }
    }

}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
