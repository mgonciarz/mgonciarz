import SwiftUI

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let shortDescription: String
    let icon: String
    let color: Color
    let details: [String]
}

struct ServicesView: View {
    var brandBlue: Color

    let bgkProducts: [Product]
    let arpProducts: [Product]

    init(brandBlue: Color) {
        self.brandBlue = brandBlue
        self.bgkProducts = [
            Product(
                name: "Gwarancja Biznesmax Plus",
                shortDescription: "Bezpłatna gwarancja spłaty kredytu z dotacją dla MŚP innowacyjnych",
                icon: "shield.checkered",
                color: brandBlue,
                details: [
                    "Bezpłatna gwarancja spłaty kredytu do 80% kwoty kredytu",
                    "Dotacja do kapitału kredytu lub odsetek",
                    "Dla MŚP prowadzących działalność innowacyjną",
                    "Maksymalna kwota gwarancji: 2,5 mln EUR",
                    "Okres gwarancji: do 20 lat (inwestycyjne), do 3 lat (obrotowe)"
                ]
            ),
            Product(
                name: "Gwarancja Ekomax",
                shortDescription: "Wsparcie MŚP na inwestycje w efektywność energetyczną",
                icon: "leaf.circle",
                color: .green,
                details: [
                    "Dla MŚP realizujących inwestycje w efektywność energetyczną",
                    "Gwarancja do 80% kwoty kredytu",
                    "Dotacja do kapitału kredytu: 20%",
                    "Maksymalna kwota gwarancji: 1,5 mln EUR"
                ]
            ),
            Product(
                name: "Gwarancja InvestEU",
                shortDescription: "Gwarancja dla projektów z udziałem środków UE",
                icon: "eurosign.circle",
                color: brandBlue,
                details: [
                    "Gwarancja dla projektów inwestycyjnych z udziałem środków UE",
                    "Do 80% kwoty kredytu",
                    "Dla MŚP i spółek o średniej kapitalizacji"
                ]
            ),
            Product(
                name: "Gwarancja Innowacja",
                shortDescription: "Wsparcie firm wdrażających innowacje i projekty B+R",
                icon: "lightbulb.circle",
                color: brandBlue,
                details: [
                    "Wsparcie dla firm wdrażających innowacje",
                    "Gwarancja do 80% kredytu",
                    "Dla MŚP z projektem B+R"
                ]
            )
        ]
        self.arpProducts = [
            Product(
                name: "ARP Pożyczka Rozwojowa pod Dotacje",
                shortDescription: "Finansowanie pomostowe przed wypłatą dotacji UE",
                icon: "arrow.up.forward.circle",
                color: .orange,
                details: [
                    "Finansowanie pomostowe przed wypłatą dotacji UE",
                    "Od 0,5 do 20 mln PLN",
                    "Oprocentowanie: WIBOR + marża"
                ]
            ),
            Product(
                name: "ARP Pożyczka Inwestycyjna z Gwarancją InvestEU",
                shortDescription: "Długoterminowe finansowanie inwestycji z gwarancją europejską",
                icon: "building.2",
                color: .orange,
                details: [
                    "Długoterminowe finansowanie inwestycji",
                    "Od 1 do 50 mln PLN",
                    "Okres kredytowania do 10 lat"
                ]
            ),
            Product(
                name: "ARP Pożyczka Obrotowa",
                shortDescription: "Finansowanie kapitału obrotowego dla firm",
                icon: "arrow.clockwise.circle",
                color: .orange,
                details: [
                    "Finansowanie kapitału obrotowego",
                    "Od 0,5 do 5 mln PLN",
                    "Okres do 3 lat"
                ]
            ),
            Product(
                name: "ARP Leasing",
                shortDescription: "Leasing maszyn, urządzeń i pojazdów",
                icon: "truck.box",
                color: .orange,
                details: [
                    "Leasing maszyn, urządzeń, pojazdów",
                    "Od 50 tys. do 5 mln PLN",
                    "Okres 2–7 lat"
                ]
            )
        ]
    }

    var body: some View {
        NavigationStack {
            List {
                Section(header: SectionHeader(title: "Gwarancje i Dotacje BGK", color: brandBlue)) {
                    ForEach(bgkProducts) { product in
                        NavigationLink(destination: ProductDetailView(product: product)) {
                            ServiceRow(
                                name: product.name,
                                description: product.shortDescription,
                                icon: product.icon,
                                color: product.color
                            )
                        }
                    }
                }

                Section(header: SectionHeader(title: "Finansowanie ARP", color: .orange)) {
                    ForEach(arpProducts) { product in
                        NavigationLink(destination: ProductDetailView(product: product)) {
                            ServiceRow(
                                name: product.name,
                                description: product.shortDescription,
                                icon: product.icon,
                                color: product.color
                            )
                        }
                    }
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

struct ProductDetailView: View {
    let product: Product

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                HStack(spacing: 16) {
                    Image(systemName: product.icon)
                        .font(.system(size: 48))
                        .foregroundColor(product.color)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(product.name)
                            .font(.title2)
                            .fontWeight(.bold)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(product.color.opacity(0.1))
                .cornerRadius(16)

                VStack(alignment: .leading, spacing: 12) {
                    Text("Szczegóły produktu")
                        .font(.headline)
                        .foregroundColor(.secondary)

                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(product.details, id: \.self) { detail in
                            HStack(alignment: .top, spacing: 10) {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(product.color)
                                    .font(.body)
                                Text(detail)
                                    .font(.body)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                    }
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)

                Spacer()
            }
            .padding()
        }
        .navigationTitle(product.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ServicesView(brandBlue: Color(red: 0.2, green: 0.6, blue: 0.9))
}
