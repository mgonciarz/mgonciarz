import SwiftUI

struct ServicesView: View {
    var brandBlue: Color

    var body: some View {
        NavigationView {
            List {
                Section(header: SectionHeader(title: "Gwarancje i Dotacje BGK", color: brandBlue)) {
                    ServiceRow(
                        name: "Gwarancja Biznesmax Plus",
                        description: "Bezpłatna gwarancja spłaty kredytu do 80% kapitału, z możliwością dotacji do kapitału lub odsetek. Przeznaczona dla MŚP.",
                        icon: "shield.checkered",
                        color: brandBlue
                    )

                    ServiceRow(
                        name: "Gwarancja Ekomax",
                        description: "Wsparcie dla MŚP na inwestycje podnoszące efektywność energetyczną z dotacją do kapitału (20%). Dla firm stawiających na zieloną energię.",
                        icon: "leaf.circle",
                        color: .green
                    )

                    ServiceRow(
                        name: "Gwarancja InvestEU",
                        description: "Gwarancje dla projektów inwestycyjnych finansowanych ze środków europejskich. Wsparcie dla większych inwestycji.",
                        icon: "eurosign.circle",
                        color: brandBlue
                    )
                }

                Section(header: SectionHeader(title: "Finansowanie ARP", color: .orange)) {
                    ServiceRow(
                        name: "ARP Pożyczka Rozwojowa pod Dotacje",
                        description: "Finansowanie pomostowe dla firm oczekujących na wypłatę dotacji unijnych. Szybkie i elastyczne wsparcie płynnościowe.",
                        icon: "arrow.up.forward.circle",
                        color: .orange
                    )

                    ServiceRow(
                        name: "ARP Pożyczka Inwestycyjna z Gwarancją InvestEU",
                        description: "Długoterminowe finansowanie projektów inwestycyjnych z gwarancją europejską. Atrakcyjne warunki dla dużych projektów.",
                        icon: "building.2",
                        color: .orange
                    )

                    ServiceRow(
                        name: "ARP Pożyczka Obrotowa",
                        description: "Finansowanie bieżącej działalności i kapitału obrotowego. Elastyczne warunki dopasowane do potrzeb firmy.",
                        icon: "arrow.clockwise.circle",
                        color: .orange
                    )

                    ServiceRow(
                        name: "ARP Leasing",
                        description: "Leasing maszyn, urządzeń i środków transportu. Korzystne warunki dla firm produkcyjnych i usługowych.",
                        icon: "truck.box",
                        color: .orange
                    )
                }

                Section(header: SectionHeader(title: "Doradztwo PSI", color: .purple)) {
                    ServiceRow(
                        name: "Polska Strefa Inwestycji",
                        description: "Kompleksowe doradztwo w uzyskaniu decyzji o wsparciu PSI. Zwolnienie CIT/PIT nawet do 15 lat.",
                        icon: "percent",
                        color: .purple
                    )
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Nasze Usługi")
        }
    }
}

struct SectionHeader: View {
    var title: String
    var color: Color

    var body: some View {
        Text(title)
            .foregroundColor(color)
            .fontWeight(.semibold)
    }
}

struct ServiceRow: View {
    var name: String
    var description: String
    var icon: String
    var color: Color

    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(color)
                .frame(width: 32)

            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.headline)

                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    ServicesView(brandBlue: Color(red: 0.2, green: 0.6, blue: 0.9))
}
