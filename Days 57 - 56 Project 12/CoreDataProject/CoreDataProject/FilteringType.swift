//
//  FilteringType.swift
//  CoreDataProject
//
//  Created by Petro Onishchuk on 2/26/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import Foundation


// MARK: Challenge 3.1 Create FilterType enum 
enum FilterType: String, CaseIterable {
    case beginsWith = "BEGINSWITH"
    case beginsWithCaseInsensitive = "BEGINSWITH[c]"
    case contains = "CONTAINS"
    case containsWithCaseInsensitive = "CONTAINS[c]"
    case endsWith = "ENDSWITH"
    case endsWithCaseInsensitive = "ENDSWITH[c]"
}










































//func checkLetter(letter: String) -> String {
//       
//       switch filteringStyle {
//       case .beginsWith:
//           return letter.capitalized
//       case .beginsWithCaseInsensitive:
//       return letter.lowercased()
//       case .contains:
//       return letter
//       case .containsWithCaseInsensitive:
//       return letter.lowercased()
//       case .endsWith:
//       return letter.lowercased()
//       default:
//           return letter.lowercased()
//       }
//       
//       
//   }

//func removeSinger(at offsets: IndexSet) {
//          for index in offsets {
//              let singer = singers[index]
//              moc.delete(singer)
//              do {
//                  try moc.save()
//              } catch {
//                  print("Error save after delete")
//              }
//              
//          }
//      }
