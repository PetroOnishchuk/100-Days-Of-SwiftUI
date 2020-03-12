//
//  SwitchingViewStatesWithEnums.swift
//  BucketList
//
//  Created by Petro Onishchuk on 3/12/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct SwitchingViewStatesWithEnums: View {
    var loadingState = LoadingState.loading
    
    var body: some View {
        Group {
            if loadingState == .loading {
                LoadingView()
            } else if loadingState == .success {
                SuccessView()
            } else if loadingState == .failed {
                FailedView()
            }
        }
    }
    
    
    enum LoadingState {
        case loading, success, failed
    }
}

struct LoadingView: View {
    var body: some View {
        Text("Loading")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Seccess!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}

struct SwitchingViewStatesWithEnums_Previews: PreviewProvider {
    static var previews: some View {
        SwitchingViewStatesWithEnums()
    }
}
