//
//  cardViewNews.swift
//  CryptoMetricsSwiftUI
//
//  Created by Danila Kardashevkii on 11.07.2023.
//

import SwiftUI

struct cardViewNews: View {
    let news: News
    
    var body: some View {
        VStack{
            VStack{
                Text(news.title)
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .padding(.top,15)
                HStack{
                    AsyncImage(url: URL(string: news.imgURL)) { image in
                        image
                            .resizable()
                            .frame(width: 100, height: 100)
                    } placeholder: {
                        // Placeholder image while loading
                    Image("no-photo")
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
                    .scaledToFit()
                    .cornerRadius(10)
                    
                    VStack{
                        Spacer()
                        Text(news.description)
                            .foregroundColor(.white)
                            .font(.system(size: 15))
                            .lineLimit(5)
                            .padding(.top,5)
                            .padding(.leading,10)
                        Spacer()
                        HStack{
                            Spacer()
                            Button {
                                
                            } label: {
                                Text("Read more...")
                                    .foregroundColor(Color("BtnSignUp"))
                                    .fontWeight(.medium)
                                    .font(.system(size: 17))
                            }

                        }
                        .padding(.bottom,20)
                    }
                }
                
            }
          
      
        }
        .frame(height: 200)
        .padding(.horizontal)
        .background(Color("SecondColor"))
        .cornerRadius(10)
    }
}

struct cardViewNews_Previews: PreviewProvider {
    static var previews: some View {
        let news = News(id: "1", feedDate: 1234567890, source: "Source", title: "News Title", imgURL: "coinstats", description: "News Description News Description News Description News Description News Description")
        cardViewNews(news: news)
    }
}
