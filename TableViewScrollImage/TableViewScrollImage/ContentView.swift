//
//  ContentView.swift
//  TableViewScrollImage
//
//  Created by Yulya on 10.05.2023.
//

import SwiftUI


class ScrollViewModel: ObservableObject {
    
}


struct ContentView: View {
    var body: some View {
       ScrollViewStickyHeader()
            .preferredColorScheme(.dark)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//
//struct CircleView: View{
//    var radius: CGFloat
//    var body: some View{
//        Circle()
//            .fill(Color.blue)
//            .frame(height: self.radius * 2)
//            .overlay(
//                Text("Hello")
//                    .font(.largeTitle)
//                    .foregroundColor(.white)
//            )
//    }
//}
//
//struct CustomCircleTestView: View {
//    @State var radius: CGFloat = 50
//    var body: some View {
//        VStack {
//            CircleView(radius: radius)
//                .frame(height: 150)
//            Slider(value: self.$radius, in: 42...90)
//            Button(action: {
//                withAnimation(.linear(duration: 1)){
//                    self.radius = 50
//                }
//            } ) {
//                Text("default radius")
//            }
//        }
//    }
//}
//
//
//struct ImageView: View {
//    @State private var colorChange = false
//    @State private var sizeChange = false
//    
//    var body: some View{
//        Image(systemName: "heart.fill")
//            .font(.system(size: 70))
//            .foregroundColor(colorChange ? .red : .blue)
//            .scaleEffect(sizeChange ? 1.5 : 1)
//            .animation(.default)
//            .onTapGesture {
//                self.colorChange.toggle()
//            }
//            .onLongPressGesture {
//                self.sizeChange.toggle()
//            }
//    }
//}
//
//
//struct ContentView: View {
//    var body: some View {
//        List (0 ..< 15) { item in
//            HStack (alignment: .center) {
//                Image(systemName: "globe.europe.africa.fill")
//                    .imageScale(.large)
//                    .foregroundColor(.accentColor)
//                Text("Hello, world!")
//            }
//            .scrollIndicators(.never)
//            .padding(10)
//        }
//        .scrollIndicators(ScrollIndicatorVisibility.hidden)
//    }
//}
//
//
//struct ListView: View {
//    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            LazyHStack {
//                Text("First Row")
//                    .padding()
//                    .background(.white)
//                    .cornerRadius(8)
//                Text("Second Row")
//                Text("Third Row")
//                    .padding()
//                    .background(.white)
//                    .cornerRadius(8)
//                Text("Fourth Row")
//                Text("Fifth Row")
//                    .padding()
//                    .background(.white)
//                    .cornerRadius(8)
//                Text("Sixth Row")
//            }
//            .padding()
//        }
//        .background(Color(uiColor: .systemGroupedBackground))
//    }
//}
//
//
//struct HeartView: View {
//    @State private var showHeartView = false
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                Button(action: {showHeartView = true }) {
//                    Text("Show Heart")
//                        .fontWeight(.bold)
//                        .padding()
//                        .frame(height: 50)
//                        .background(.blue)
//                        .foregroundColor(.white)
//                        .buttonStyle(.borderedProminent)
//                        .controlSize(.large)
//                        .cornerRadius(10)
//                }
//                NavigationLink("", destination: ImageView(), isActive: $showHeartView)
//            }
//        }
//    }
    
    //    struct ContentView_Previews: PreviewProvider {
    //        static var previews: some View {
    //            ContentView()
    //            CustomCircleTestView()
    //            ImageView()
    //            ListView()
    //        }
    //    }
//}
