//
//  CommonView.swift
//  Skincare
//
//  Created by Thais da Silva Bras on 13/12/21.
//

import SwiftUI

struct CommonView: View {
    var body: some View {
        #if APPCLIP
        Text("App Clip")
        #else
        Text("App Inteiro")
        #endif
    }
}

struct CommonView_Previews: PreviewProvider {
    static var previews: some View {
        CommonView()
    }
}
