//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Ala'a Araishi on 12/28/20.
//

import SwiftUI

struct WeatherView: View {
    
    @ObservedObject var viewModel : WeatherViewModel
    
    var body: some View {
        VStack{
            HStack {
                Spacer()
            }
            Text(viewModel.cityName).font(.largeTitle).padding()
            Text(viewModel.temperature).font(.system(size: 70)).bold()
            Text(viewModel.weatherIcon).font(.system(size: 120))
            Text(viewModel.weatherDiscreption).padding()
        }.background(Color.blue).opacity(0.90)
        .cornerRadius(30).padding().onAppear(perform: viewModel.refresh)
        .shadow(radius: 25).shadow(color: Color.gray, radius: 30)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel : WeatherViewModel(weatherService: WeatherService()))
    }
}
