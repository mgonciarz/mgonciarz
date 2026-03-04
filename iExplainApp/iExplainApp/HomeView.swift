import SwiftUI

struct HomeView: View {
    var brandBlue: Color

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Image(systemName: "chart.bar.doc.horizontal")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 80)
                        .foregroundColor(brandBlue)
                        .padding(.top, 20)

                    Text("iEXPLAIN")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(brandBlue)

                    Text("Twój partner w pozyskiwaniu finansowania")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    Divider().padding()

                    VStack(alignment: .leading, spacing: 12) {
                        Text("O nas")
                            .font(.title3)
                            .fontWeight(.bold)

                        Text("iExplain ułatwia firmom dostęp do finansowania publicznego. Kompleksowo wspieramy proces jego pozyskania – w szczególności w zakresie programów i instrumentów oferowanych przez Agencję Rozwoju Przemysłu (ARP) oraz Bank Gospodarstwa Krajowego (BGK).")
                            .multilineTextAlignment(.leading)

                        Text("Ofertę uzupełnia doradztwo w zakresie uzyskania zwolnień podatkowych w ramach Polskiej Strefy Inwestycji (PSI).")
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.horizontal)

                    Divider().padding(.horizontal)

                    VStack(spacing: 16) {
                        HStack(spacing: 16) {
                            InfoCard(
                                icon: "building.columns",
                                title: "BGK",
                                description: "Gwarancje i instrumenty Banku Gospodarstwa Krajowego",
                                color: brandBlue
                            )
                            InfoCard(
                                icon: "arrow.up.right.circle",
                                title: "ARP",
                                description: "Pożyczki i leasing Agencji Rozwoju Przemysłu",
                                color: .green
                            )
                        }

                        InfoCard(
                            icon: "percent",
                            title: "PSI",
                            description: "Zwolnienia podatkowe w ramach Polskiej Strefy Inwestycji",
                            color: .orange
                        )
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
            }
            .navigationTitle("Witamy w iExplain")
        }
    }
}

struct InfoCard: View {
    var icon: String
    var title: String
    var description: String
    var color: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(color)

            Text(title)
                .font(.headline)
                .foregroundColor(color)

            Text(description)
                .font(.caption)
                .foregroundColor(.secondary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.07), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    HomeView(brandBlue: Color(red: 0.2, green: 0.6, blue: 0.9))
}
