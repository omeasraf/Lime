//
//  StoryView.swift
//  StoryView
//
//  Created by Ome Asraf on 8/9/21.
//

import SwiftUI

struct StoryCircleView: View {
    var body: some View {
        Image(systemName: "plus")
            .frame(width: 50, height: 50)
            .background(Color.clear)
            .foregroundColor(Color(UIColor.label))
            .clipShape(Circle())
            .overlay(Circle().stroke(Color(UIColor.label), lineWidth: 5))
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryCircleView()
    }
}
