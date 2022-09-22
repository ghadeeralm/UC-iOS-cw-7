//
//  ContentView.swift
//  cw7 part1
//
//  Created by ghadeer almajed on 21/09/2022.
//

import SwiftUI
struct MovieInfo: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let cast: [CastMember]
}
struct CastMember: Identifiable{
    let id = UUID()
    let name: String
    let ImageName: String
}



struct ContentView: View {
    
    let movies = [
        MovieInfo(
            title: "The Hang Over",
            imageName: "hang-over",
            
            cast:[
                CastMember(
                    name: "Bradley Cooper", ImageName: "Bradley-Cooper"
                ), CastMember(name: "Zach Galifiankis", ImageName: "Zach-Galifianakis"),
                CastMember(name: "Ed Helms", ImageName: "Ed-Helms")
            ]
                 ),
        
        
    MovieInfo(
        title: "Maleficent ",
        imageName: "maleficent",
        cast:[
            CastMember(
                name: "Angelina Jolie", ImageName: "Angelina-Jolie"
            )]
    ),
        
        
        MovieInfo(
            title: "Nanny Mcfee",
            imageName: "nanny-mcphee",
            cast:[
                CastMember(
                    name: "Emma Thompson",
                    ImageName: "Emma-Thompson")])
    ]
    
    
    
    var body: some View {
//        Text("Hello, world!")
//           .padding()
        NavigationView {
            List{
                ForEach(movies) {
                    movie in
                    NavigationLink(destination: MovieDetail(movie: movie)) {
                        ExtractedView(movie: movie)
                    }
                    
                }
            }
            .navigationTitle("Movies")
            
        }
        .accentColor(.gray)
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct MovieDetail: View {
    let movie: MovieInfo
    var body: some View{
        ZStack {
            Color.black
                .ignoresSafeArea()
            Image(movie.imageName)
                .resizable()
                .scaledToFill()
            
                .opacity(0.5)
                .blur(radius: 10)
                .ignoresSafeArea()
            VStack{
                Image(movie.imageName)
                    .resizable()
                    .frame(width: 130, height: 130)
                    .clipShape(Circle())
                    .padding(5)
                    .border(.white, width: 0.4)
//                    .clipShape(Circle())
                    .padding(3)
                    .background(.white)
                    .clipShape(Circle())
                Text(movie.title)
                 .font(.largeTitle)
                   .aspectRatio(contentMode: .fit)
                   .foregroundColor(.white)
                Spacer()
                ScrollView(.horizontal) {
                    
                    HStack{
                        ForEach(movie.cast){ CastMember in
                            VStack{
                                Image(CastMember.ImageName)
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                                Text(CastMember.name)
                                    .foregroundColor(.white)
                           .padding()
                                
                            }
                        }
                    }
                    
                }
              
                
            }
        }
    }
}
struct ExtractedView:  View{
    let movie: MovieInfo
    var body: some View{
        HStack{
            Image(movie.imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .aspectRatio(1.0, contentMode: .fit)
                .clipShape(Circle())
            Text(movie.title)
        }
    }
}
