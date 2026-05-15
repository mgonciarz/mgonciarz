import SwiftUI

struct HomeView: View {
    var brandBlue: Color

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    VStack(spacing: 12) {
                        Image(systemName: "chart.bar.doc.horizontal")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 80)
                            .foregroundColor(brandBlue)
                            .padding(.top, 24)

                        Text("iEXPLAIN")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(brandBlue)

                        Text("Twój partner w pozyskiwaniu finansowania")
                            .font(.title3)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.secondary)
                            .padding(.horizontal)
                    }

                    Divider()
                        .padding(.horizontal)

                    VStack(alignment: .leading, spacing: 12) {
                        Text("O nas")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal)

                        Text("iExplain ułatwia firmom dostęp do finansowania publicznego. Kompleksowo wspieramy proces pozyskania finansowania – w szczególności w zakresie programów i instrumentów oferowanych przez Agencję Rozwoju Przemysłu (ARP) oraz Bank Gospodarstwa Krajowego (BGK). Ofertę uzupełnia doradztwo w zakresie uzyskania zwolnień podatkowych w ramach Polskiej Strefy Inwestycji (PSI).")
                            .font(.body)
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal)
                    }

                    HStack(spacing: 12) {
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
                        InfoCard(
                            icon: "percent",
                            title: "PSI",
                            description: "Zwolnienia podatkowe Polskiej Strefy Inwestycji",
                            color: .orange
                        )
                    }
                    .padding(.horizontal)

                    Divider()
                        .padding(.horizontal)

                    VStack(alignment: .leading, spacing: 16) {
                        Text("Dlaczego iExplain?")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal)

                        VStack(alignment: .leading, spacing: 12) {
                            WhyRow(icon: "star.fill", color: brandBlue, text: "Doświadczenie – znamy programy od podszewki")
                            WhyRow(icon: "square.stack.3d.up.fill", color: .green, text: "Kompleksowość – od analizy po rozliczenie")
                            WhyRow(icon: "target", color: .orange, text: "Skuteczność – osiągamy zamierzone rezultaty")
                            WhyRow(icon: "person.crop.circle.badge.checkmark", color: .purple, text: "Indywidualne podejście – każda firma jest inna")
                        }
                        .padding(.horizontal)
                    }
                    .padding(.bottom, 24)
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

struct WhyRow: View {
    var icon: String
    var color: Color
    var text: String

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .font(.body)
                .foregroundColor(color)
                .frame(width: 24)
            Text(text)
                .font(.body)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

#Preview {
    HomeView(brandBlue: Color(red: 0.2, green: 0.6, blue: 0.9))
}
