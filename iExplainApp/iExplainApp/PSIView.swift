import SwiftUI

struct PSIView: View {
    var brandBlue: Color

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    ZStack {
                        LinearGradient(
                            colors: [brandBlue, brandBlue.opacity(0.65)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )

                        VStack(spacing: 12) {
                            Image(systemName: "percent")
                                .font(.system(size: 52))
                                .foregroundColor(.white)

                            Text("Polska Strefa Inwestycji")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)

                            Text("Zwolnienie CIT/PIT nawet do 15 lat")
                                .font(.subheadline)
                                .foregroundColor(.white.opacity(0.88))
                        }
                        .padding(.vertical, 36)
                        .padding(.horizontal)
                    }

                    VStack(alignment: .leading, spacing: 20) {
                        Text("Polska Strefa Inwestycji to rządowy program wsparcia przedsiębiorców w formie zwolnienia z podatku dochodowego CIT lub PIT. Program zastąpił Specjalne Strefy Ekonomiczne i obejmuje teren całego kraju.")
                            .font(.body)
                            .padding(.top, 4)

                        PSISection(
                            title: "Korzyści",
                            icon: "gift.fill",
                            color: .green,
                            items: [
                                "Zwolnienie CIT/PIT do 15 lat",
                                "Do 70% wartości inwestycji jako zwolnienie podatkowe",
                                "Brak limitów lokalizacyjnych – cały kraj",
                                "Możliwość łączenia z innymi instrumentami wsparcia"
                            ]
                        )

                        PSISection(
                            title: "Kto może skorzystać?",
                            icon: "person.3.fill",
                            color: brandBlue,
                            items: [
                                "MŚP i duże firmy",
                                "Produkcja przemysłowa",
                                "Usługi nowoczesne: IT, B+R, centra usług",
                                "Nowe zakłady, automatyzacja, reinwestycje"
                            ]
                        )

                        VStack(alignment: .leading, spacing: 12) {
                            Label("Minimalna wartość inwestycji", systemImage: "chart.bar.fill")
                                .font(.headline)
                                .foregroundColor(.orange)

                            VStack(spacing: 0) {
                                PSITableRow(label: "Mikro / Małe", value: "200 000 PLN", isEven: false)
                                PSITableRow(label: "Średnie", value: "400 000 PLN", isEven: true)
                                PSITableRow(label: "Duże (C strefa)", value: "10 000 000 PLN", isEven: false)
                                PSITableRow(label: "Duże (B strefa)", value: "15 000 000 PLN", isEven: true)
                                PSITableRow(label: "Duże (A strefa)", value: "100 000 000 PLN", isEven: false)
                            }
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(.separator), lineWidth: 0.5)
                            )
                        }

                        VStack(alignment: .leading, spacing: 12) {
                            Label("Intensywność pomocy regionalnej", systemImage: "map.fill")
                                .font(.headline)
                                .foregroundColor(brandBlue)

                            VStack(spacing: 0) {
                                HStack {
                                    Text("Region")
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Text("Duże")
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                        .frame(width: 44, alignment: .center)
                                    Text("Średnie")
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                        .frame(width: 52, alignment: .center)
                                    Text("Małe")
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                        .frame(width: 44, alignment: .center)
                                }
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(Color(.tertiarySystemBackground))

                                PSIAidRow(region: "Wschodnia Polska", large: "50%", medium: "60%", small: "70%", isEven: false)
                                PSIAidRow(region: "Polska Centralna", large: "35%", medium: "45%", small: "55%", isEven: true)
                                PSIAidRow(region: "Mazowsze (poza Warszawą)", large: "35%", medium: "45%", small: "55%", isEven: false)
                                PSIAidRow(region: "Warszawa", large: "10%", medium: "20%", small: "30%", isEven: true)
                            }
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(.separator), lineWidth: 0.5)
                            )
                        }

                        VStack(alignment: .leading, spacing: 12) {
                            Label("Proces uzyskania wsparcia PSI", systemImage: "arrow.right.circle.fill")
                                .font(.headline)
                                .foregroundColor(.purple)

                            VStack(alignment: .leading, spacing: 8) {
                                PSIProcessStep(number: "1", text: "Analiza kwalifikowalności")
                                PSIProcessStep(number: "2", text: "Przygotowanie wniosku")
                                PSIProcessStep(number: "3", text: "Decyzja o Wsparciu")
                                PSIProcessStep(number: "4", text: "Realizacja inwestycji")
                                PSIProcessStep(number: "5", text: "Rozliczenie zwolnienia podatkowego")
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(12)

                        NavigationLink(destination: ContactView(brandBlue: brandBlue)) {
                            HStack {
                                Spacer()
                                Image(systemName: "envelope.fill")
                                Text("Skontaktuj się z nami")
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(brandBlue)
                            .cornerRadius(12)
                        }
                        .padding(.bottom, 24)
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
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
                            .fixedSize(horizontal: false, vertical: true)
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

struct PSITableRow: View {
    let label: String
    let value: String
    let isEven: Bool

    var body: some View {
        HStack {
            Text(label)
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(value)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.orange)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(isEven ? Color(.secondarySystemBackground) : Color(.systemBackground))
    }
}

struct PSIAidRow: View {
    let region: String
    let large: String
    let medium: String
    let small: String
    let isEven: Bool

    var body: some View {
        HStack {
            Text(region)
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(large)
                .font(.caption)
                .fontWeight(.semibold)
                .frame(width: 44, alignment: .center)
            Text(medium)
                .font(.caption)
                .fontWeight(.semibold)
                .frame(width: 52, alignment: .center)
            Text(small)
                .font(.caption)
                .fontWeight(.semibold)
                .frame(width: 44, alignment: .center)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(isEven ? Color(.secondarySystemBackground) : Color(.systemBackground))
    }
}

struct PSIProcessStep: View {
    let number: String
    let text: String

    var body: some View {
        HStack(spacing: 12) {
            Text(number)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 28, height: 28)
                .background(Color.purple)
                .clipShape(Circle())
            Text(text)
                .font(.subheadline)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

#Preview {
    PSIView(brandBlue: Color(red: 0.2, green: 0.6, blue: 0.9))
}
