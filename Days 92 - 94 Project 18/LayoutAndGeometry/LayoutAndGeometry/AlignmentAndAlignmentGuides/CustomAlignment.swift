//
//  CustomAlignment.swift
//  LayoutAndGeometry
//
//  Created by Petro Onishchuk on 4/20/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct CustomAlignment: View {
        var body: some View {
            HStack(alignment: .midAccountAndName ) {
                VStack {
                    Text("@twostraws")
                        .alignmentGuide(.midAccountAndName) { (d) -> CGFloat in
                            d[VerticalAlignment.center]
                    }
                    Image("apollo11")
                    .resizable()
                        .frame(width: 64, height: 64)
                }
                
                VStack {
                    Text("Full name: ")
                    Text("PAUL HUDSON")
                        .alignmentGuide(.midAccountAndName) { (d) -> CGFloat in
                                d[VerticalAlignment.center]
                        }
                        .font(.largeTitle)
                }
               
            }
        }
    }

    extension VerticalAlignment {
        struct MidAccountAndName: AlignmentID {
            static func defaultValue(in context: ViewDimensions) -> CGFloat {
                context[.top]
            }
        }
        static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
    }


struct CustomAlignment_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlignment()
    }
}
