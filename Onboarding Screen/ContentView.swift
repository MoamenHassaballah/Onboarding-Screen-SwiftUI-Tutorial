//
//  ContentView.swift
//  Onboarding Screen
//
//  Created by Moamen Hassaballah on 23/02/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedIndex: Int? = 0
    
    private let items = [
            BoardModel(
                title: "Search for favorite food near you",
                subtitle: "Discover the food from over 3000 restaurants.",
                image: "search_food"),
            
            BoardModel(
            title: "Fast delivery to your door",
            subtitle: "Fast delivery to your door, office or any other place.",
            image: "fast_delivery"
            ),
            
            BoardModel(title:
            "Tracking delivery on the map",
             subtitle: "Track your delivery on the map at any moment.",
             image: "delivery_tracking"
             ),
        ]
    
    
    
    var body: some View {
        GeometryReader { proxy in
            
            ZStack {
                
                Color("app_accent_color")
                
                
                VStack{
                    
                    VStack{
                        ScrollView(.horizontal){
                            
                            
                            HStack{
                                
                                
                                ForEach(0..<items.count, id: \.self){ index in
                                    
                                    PageItem(selectIndex: $selectedIndex, boardModel: items[index], index: index)
                                        .frame(maxWidth: proxy.size.width)
                                        .id(index)
                                
                                    
                                }
                                
                            }
                            .scrollTargetLayout()
                            
                        }
                        .scrollDisabled(true)
                        .scrollPosition(id: $selectedIndex)
                        .scrollTargetBehavior(.viewAligned)
                        .scrollIndicators(.hidden)
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.top, 20)
                    .background(
                        
                        UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 40, bottomTrailing: 40))
                            .fill(.white)
                        
                    )
                    
                    
                    HStack{
                        
                        if selectedIndex != items.count - 1 {
                            Button{} label: {
                                Text("Skip")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 20))
                                    .frame(maxWidth: .infinity)
                                    .padding(10)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(style: .init())
                                            .fill(.white)
                                    )
                            }
                        }
                        
                        
                        Button{
                            nextPage()
                        } label: {
                            Text(selectedIndex == items.count - 1 ? "Get Started" : "Next")
                                .foregroundStyle(Color("app_accent_color"))
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity)
                                .padding(10)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(.white)
                                )
                        }
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: 150)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)

                
                
                Button{
                    previousPage()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color("app_accent_color"))
                        .font(.system(size: 30))
                }
                .padding()
                .containerRelativeFrame([.horizontal, .vertical], alignment: .topLeading)
                
            }
            .ignoresSafeArea()
            
        }
    }
    
    
    private func nextPage(){
        if selectedIndex! < items.count - 1{
            withAnimation(.easeInOut(duration: 1)){
                self.selectedIndex! += 1;
            }
        }
    }
    
    private func previousPage(){
        if selectedIndex! > 0 {
            withAnimation(.easeInOut(duration: 1)){
                self.selectedIndex! -= 1;
            }
        }
    }
}

#Preview {
    ContentView()
}
