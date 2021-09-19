//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Karem on 9/19/21.
//

import SwiftUI


struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }

    var body: some View {
        VStack (alignment: .center, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        })
    }
}

struct LargeColordTitled:ViewModifier {
    let color:Color
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(color)
    }
}

extension View{
    func LargeColorTitled(color:Color)-> some View{
        modifier(LargeColordTitled(color: color))
    }
}

struct ContentView: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)").frame(width: 50, height: 50, alignment: .center).LargeColorTitled(color: .green)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
