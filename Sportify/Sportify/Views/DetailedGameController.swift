

//
//  DetailedGameController.swift
//  Sportify
//
//  Created by Meto Ajagu on 11/29/23.
//
import SwiftUI
import SDWebImageSwiftUI
import SDWebImage
struct DetailedGameController: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    @StateObject var viewModelMC = ViewModel(type: "Mens/current")
    @StateObject var viewModelMF = ViewModel(type: "Mens/future")
    
    @StateObject var viewModelFC = ViewModel(type: "Womens/current")
    @StateObject var viewModelFF = ViewModel(type: "Womens/future")
    
    @State private var isWomensButtonPressed = false
    @State private var isMensButtonPressed = false
    
    
    let sportType: String
    
    var body: some View {
        
        NavigationStack{
            
            VStack{
                ScrollView(.vertical){
                    //whichever sport button it interacted with
                    HStack {
                        Text(sportType)
                            .navigationBarBackButtonHidden(true)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .frame(width: 200, height: 100, alignment: .center)
                        if (sportType == "Hockey"){
                            Image(systemName: "figure.hockey")
                                .font(.system(size: 50, weight: .bold))
                        }
                        if (sportType == "Basketball"){
                            Image(systemName: "basketball")
                                .font(.system(size: 50, weight: .bold))
                        }
                        if (sportType == "Tennis"){
                            Image(systemName: "figure.tennis")
                                .font(.system(size: 50, weight: .bold))
                        }
                        if (sportType == "Soccer"){
                            Image(systemName: "figure.soccer")
                                .font(.system(size: 50, weight: .bold))
                        }
                        if (sportType == "Football"){
                            Image(systemName: "football")
                                .font(.system(size: 50, weight: .bold))
                        }
                    }
                    HStack{
                        Spacer()
                        Button("Men's \(sportType)"){
                            isMensButtonPressed.toggle()
                            
                        }
                        .padding()
                        .background(.gray)
                        .foregroundStyle(.white)
                        .clipShape(Capsule())
                        Spacer()
                        if sportType != "Football"{
                            Button("Women's \(sportType)"){
                                isWomensButtonPressed.toggle()
                            }
                            .padding()
                            .background(.gray)
                            .foregroundStyle(.white)
                            .clipShape(Capsule())
                        }
                        Spacer()
                    }
    
                    VStack(alignment: .leading) {
                        VStack(spacing: 0){
                            Text("Current Events")
                                .font(.largeTitle)
                                .foregroundColor(.black)
                                .frame(width: 350, height: 50, alignment: .leading)
                                .fontWeight(.bold)
                            
                            Divider()
                        }
                        
                        if (isMensButtonPressed == false){
                            ForEach(viewModelMC.games) { game in
                                NavigationLink (
                                    destination: DetailedGameView(game: game),
                                    label: {
                                        VStack{
                                            Spacer()
                                            HStack {
                                                Spacer()
                                                WebImage(url: URL(string: game.away_team_logo))
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 50, height: 50)
                                                
                                                Text("\(game.sex) \(game.sport) vs. \(game.away_team_name)")
                                                // Text("\(game.away_team_name)")
                                                Image(systemName: "chevron.right")
                                                    .font(.system(size: 20, weight: .bold))
                                                
                                                Spacer()
                                            }
                                            HStack {
                                                
                                                Text("\(game.location) ")
                                                Text("-")
                                                    .bold()
                                                Text("7 - 0")
                                            }
                                            Spacer()
                                        }
                                        .background {
                                            RoundedRectangle(cornerRadius: 4)
                                                .fill(Color.cellBackground)
                                                .stroke(Color.black, lineWidth: 2)
                                        }
                                        .padding()
                                    }
                                ).buttonStyle(PlainButtonStyle())
                                
                            }
                        }
                    }
                  .onAppear {
                      viewModelMC.fetchData()
}
                    VStack{
                        if (isWomensButtonPressed == false) {
                            ForEach(viewModelFC.games) { game in
                                NavigationLink (
                                    destination: DetailedGameView(game: game),
                                    label: {
                                        VStack{
                                            Spacer()
                                            HStack {
                                                Spacer()
                                                WebImage(url: URL(string: game.away_team_logo))
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 50, height: 50)
                                                Text("\(game.sex) \(game.sport) vs. \(game.away_team_name)")
                                                Image(systemName: "chevron.right")
                                                    .font(.system(size: 20, weight: .bold))
                                                
                                                Spacer()
                                            }
                                            HStack {
                                                Text("\(game.location) ")
                                                Text("-")
                                                    .bold()
                                                Text("7 - 0")
                                            }
                                            Spacer()
                                        }
                                        .background {
                                            RoundedRectangle(cornerRadius: 4)
                                                .fill(Color.cellBackground)
                                                .stroke(Color.black, lineWidth: 2)
                                        }
                                        .padding()
                                    }
                                ).buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                .onAppear() {
                    viewModelFC.fetchData()
                }
                    
                    VStack{
                        VStack(alignment: .leading) {
                            VStack(spacing: 0){
                                Text("Upcoming Events")
                                    .font(.largeTitle)
                                    .foregroundColor(.black)
                                    .frame(width: 350, height: 50, alignment: .leading)
                                    .fontWeight(.bold)
                                
                                Divider()
                                
                            }
                            if (isWomensButtonPressed == false) {
                                ForEach(viewModelFF.games) { game in
                                    NavigationLink (
                                        destination: DetailedGameView(game: game),
                                        label: {
                                            VStack{
                                                Spacer()
                                                HStack {
                                                    Spacer()
                                                    WebImage(url: URL(string: game.away_team_logo))
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 50, height: 50)
                                                    Text("\(game.sex) \(game.sport) vs. \(game.away_team_name)")
                                                    Image(systemName: "chevron.right")
                                                        .font(.system(size: 20, weight: .bold))
                                                    
                                                    Spacer()
                                                }
                                                HStack {
                                                    
                                                    Text("\(game.location) -")
                                                        .multilineTextAlignment(.leading)
                                                    Text("\(game.date_time.formatted(date: .long, time: .shortened))")
                                                }
                                                Spacer()
                                            }
                                            .background {
                                                RoundedRectangle(cornerRadius: 4)
                                                    .fill(Color.cellBackground)
                                                    .stroke(Color.black, lineWidth: 2)
                                            }
                                            .padding()
                                        }
                                    ).buttonStyle(PlainButtonStyle())
                                }
                            }
                        }
                        .onAppear() {
                            viewModelFF.fetchData()
                        }
                        
                        if (isMensButtonPressed == false) {
                            ForEach(viewModelMC.games) { game in
                                NavigationLink (
                                    destination: DetailedGameView(game: game),
                                    label: {
                                        VStack{
                                            Spacer()
                                            HStack {
                                                Spacer()
                                                WebImage(url: URL(string: game.away_team_logo))
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 50, height: 50)
                                                Text("\(game.sex) \(game.sport) vs. \(game.away_team_name)")
                                                Image(systemName: "chevron.right")
                                                    .font(.system(size: 20, weight: .bold))
                                                
                                                Spacer()
                                            }
                                            HStack {
                                                
                                                Text("\(game.location) -")
                                                    .multilineTextAlignment(.leading)
                                                Text("\(game.date_time.formatted(date: .long, time: .shortened))")
                                            }
                                            Spacer()
                                        }
                                        .background {
                                            RoundedRectangle(cornerRadius: 4)
                                                .fill(Color.cellBackground)
                                                .stroke(Color.black, lineWidth: 2)
                                        }
                                        .padding()
                                    }
                                ).buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    .onAppear() {
                    viewModelMC.fetchData()
                }
                        
                        .navigationBarBackButtonHidden(true)
                        .toolbar(content: {
                            ToolbarItem (placement: .bottomBar)  {
                                
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }, label: {
                                    //  Image(systemName: "arrow.left")
                                    Image(systemName: "house")
                                        .foregroundColor(.black)
                                    Text("home")
                                        .foregroundColor(.black)
                                })
                            }
                        })
                        
                    
                    
                    }
                }
            }
        }
    }

    
//    
//#Preview {
//    DetailedGameController(sportType: "RANDOM SPORT")
//}
