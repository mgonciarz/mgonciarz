import SwiftUI

struct ContentView: View {
    let brandBlue = Color(red: 0.2, green: 0.6, blue: 0.9)

    var body: some View {
        TabView {
            HomeView(brandBlue: brandBlue)
                .tabItem {
                    Label("O nas", systemImage: "info.circle")
                }

            ServicesView(brandBlue: brandBlue)
                .tabItem {
                    Label("Usługi", systemImage: "briefcase")
                }

            PSIView(brandBlue: brandBlue)
                .tabItem {
                    Label("Strefa PSI", systemImage: "percent")
                }

            CalculatorView(brandBlue: brandBlue)
                .tabItem {
                    Label("Kalkulator", systemImage: "function")
                }

            ContactView(brandBlue: brandBlue)
                .tabItem {
                    Label("Kontakt", systemImage: "phone.fill")
                }
        }
        .accentColor(brandBlue)
    }
}

#Preview {
    ContentView()
}
