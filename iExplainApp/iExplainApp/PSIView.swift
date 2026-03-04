import SwiftUI

struct PSIView: View {
    var brandBlue: Color

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    // Hero banner
                    ZStack {
                        LinearGradient(
                            colors: [brandBlue, brandBlue.opacity(0.7)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )

                        VStack(spacing: 10) {
                            Image(systemName: "percent")
                                .font(.system(size: 48))
                                .foregroundColor(.white)

                            Text("Im więcej rozwijasz firmę,\ntym mniej płacisz podatku")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)

                            Text("Polska Strefa Inwestycji")
                                .font(.subheadline)
                                .foregroundColor(.white.opacity(0.85))
                        }
                        .padding(.vertical, 30)
                    }

                    VStack(alignment: .leading, spacing: 20) {
                        Text("To rządowy program wsparcia przedsiębiorców. Dzięki niemu zyskujesz zwolnienie CIT lub PIT nawet do 15 lat.")
                            .font(.body)
                            .padding(.top)

                        PSISection(
                            title: "Dla kogo jest PSI?",
                            icon: "person.3",
                            color: brandBlue,
                            items: [
                                "Małe, średnie i duże przedsiębiorstwa",
                                "Firmy produkcyjne i nowoczesnych usług (IT, B+R)",
                                "Inwestycje w nowe zakłady i automatyzację",
                                "Nowe miejsca pracy i reinwestycje"
                            ]
                        )

                        PSISection(
                            title: "Ile możesz zyskać?",
                            icon: "eurosign.circle",
                            color: .green,
                            items: [
                                "Do 70% wartości inwestycji jako zwolnienie podatkowe",
                                "Zwolnienie CIT lub PIT nawet do 15 lat",
                                "Brak skomplikowanych procedur rozliczania dotacji",
                                "Możliwość łączenia z innymi formami wsparcia"
                            ]
                        )

                        PSISection(
                            title: "Jakie warunki trzeba spełnić?",
                            icon: "checkmark.seal",
                            color: .orange,
                            items: [
                                "Minimalna wartość inwestycji (zależy od lokalizacji i typu firmy)",
                                "Utrzymanie inwestycji przez 5 lat (MŚP) lub 3 lata (duże)",
                                "Spełnienie kryteriów jakościowych lub ilościowych",
                                "Zgodność z profilem działalności PSI"
                            ]
                        )

                        VStack(alignment: .leading, spacing: 8) {
                            Label("Jak możemy pomóc?", systemImage: "lightbulb")
                                .font(.headline)
                                .foregroundColor(brandBlue)

                            Text("Nasi eksperci przeprowadzą Cię przez cały proces – od oceny kwalifikowalności inwestycji, przez przygotowanie wniosku, aż po uzyskanie Decyzji o Wsparciu i rozliczenie zwolnienia podatkowego.")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding()
                        .background(brandBlue.opacity(0.08))
                        .cornerRadius(12)
                    }
                    .padding()
                }
            }
            .navigationTitle("Strefa PSI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct PSISection: View {
    var title: String
    var icon: String
    var color: Color
    var items: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label(title, systemImage: icon)
                .font(.headline)
                .foregroundColor(color)

            VStack(alignment: .leading, spacing: 6) {
                ForEach(items, id: \.self) { item in
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(color)
                            .font(.subheadline)
                        Text(item)
                            .font(.subheadline)
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
    }
}

#Preview {
    PSIView(brandBlue: Color(red: 0.2, green: 0.6, blue: 0.9))
}
