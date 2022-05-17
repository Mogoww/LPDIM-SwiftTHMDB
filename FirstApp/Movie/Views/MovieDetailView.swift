//
//  MovieDetailView.swift
//  FirstApp
//
//  Created by Digital on 29/03/2022.
//

import SwiftUI

struct MovieDetailView: View {
    
    @ObservedObject var movieViewModel: MovieViewModel
    
    
    var body: some View {
        if let movie = self.movieViewModel.movie{
            ScrollView{
                VStack(content: {
                    //Header
                    ZStack(alignment:.topLeading, content: {
                        ZStack(alignment:.center, content: {
                            ImageView(withURL: movie.backdropURL, type: "backgroundDisplay")
                            Button{
                                    UIApplication.shared.open(URL(string:movie.trailer ?? "https://www.youtube.com/watch?v=dQw4w9WgXcQ")!)
                            }label: {
                                    Image(systemName: "play.circle")
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .foregroundColor(Color.red)
                            }
                        })
                            
                        HStack(alignment:.bottom ,content: {
                            ImageView(withURL: movie.posterURL, type: "posterDisplay")
                            
                            VStack(alignment:.leading,content: {
                                
                                Text("Date de sortie: \(movie.createdDateMovie)")
                                    .padding(.bottom,15)
                                        
                                Text("Durée: \(movie.lengthConvert)")
                                    .padding(.bottom, 15)
                                   
                            })

                        }).padding(.top,150)

                    })
                        
                    Group{
                            
                        let columns = [
                                GridItem(.flexible()),
                                GridItem(.flexible()),
                                GridItem(.flexible())
                            ]
                            
                        LazyVGrid(columns: columns,alignment: .center, content:  {
                            ForEach(movie.genreList, id: \.self) {
                                if($0 != ""){
                                    Text("\($0)")
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 2)
                                        .background(Color.blue)
                                        .cornerRadius(5)
                                }
                            }
                        })
                        .foregroundColor(Color.white)
                            
                        Text(movie.title)
                            .font(.title)
                        Text(movie.original_title)
                            .font(.system(size: 12, weight: .light, design: .serif))
                                .italic()
                            
                        Text(movie.overview)
                            
                    }.padding()
                        
                })
                
                
            }
            .foregroundColor(Color.black)
            .background(Color.white)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movieViewModel: MovieViewModel(idMovie: 0))
    }
}
