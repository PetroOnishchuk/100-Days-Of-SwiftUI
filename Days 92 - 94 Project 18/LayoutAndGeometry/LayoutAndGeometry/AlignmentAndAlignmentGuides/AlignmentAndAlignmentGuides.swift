//
//  AlignmentAndAlignmentGuides.swift
//  LayoutAndGeometry
//
//  Created by Petro Onishchuk on 4/20/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct AlignmentAndAlignmentGuides: View {
     var body: some View {
            //V.1
    //        HStack(alignment: .lastTextBaseline) {
    //            Text("Live")
    //                .font(.caption)
    //            Text("long")
    //            Text("and")
    //                .font(.title)
    //            Text("poster")
    //                .font(.largeTitle)
    //        }
            //V.2
    //        VStack(alignment: .leading, spacing: nil) {
    //            Text("Hello, world!")
    //                .alignmentGuide(.leading) { (d ) -> CGFloat in
    //                    d[.trailing]
    //            }
    //            Text("Hello is a longer line of text")
    //        }
    //        .background(Color.red)
    //        .frame(width: 400, height: 400)
    //        .background(Color.blue)
            
            VStack(alignment: .leading, spacing: nil) {
                ForEach(0..<10) {
                    position in
                    Text("Number \(position)")
                        .alignmentGuide(.leading) { (_) -> CGFloat in
                            CGFloat(position) * -10
                    }
                }
            
            }
            .background(Color.red)
            .frame(width: 400, height: 400)
            .background(Color.blue)
        }
}

struct AlignmentAndAlignmentGuides_Previews: PreviewProvider {
    static var previews: some View {
        AlignmentAndAlignmentGuides()
    }
}
