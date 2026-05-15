import SwiftUI

func formatPLN(_ value: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.groupingSeparator = " "
    formatter.groupingSize = 3
    formatter.maximumFractionDigits = 0
    formatter.minimumFractionDigits = 0
    return (formatter.string(from: NSNumber(value: value)) ?? "0") + " PLN"
}

struct CalculatorView: View {
    var brandBlue: Color

    @State private var selectedCalculator = 0

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Picker("Kalkulator", selection: $selectedCalculator) {
                    Text("PSI").tag(0)
                    Text("BGK Biznesmax+").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                if selectedCalculator == 0 {
                    PSICalculatorView(brandBlue: brandBlue)
                } else {
                    BGKCalculatorView(brandBlue: brandBlue)
                }
            }
            .navigationTitle("Kalkulator")
        }
    }
}

struct PSICalculatorView: View {
    var brandBlue: Color

    @State private var investmentText: String = ""
    @State private var companySize: Int = 0
    @State private var region: Int = 0
    @State private var annualIncomeText: String = ""

    private let companySizes = ["Mikro/Małe", "Średnie", "Duże"]
    private let regions = ["Wschodnia Polska", "Polska Centralna / Mazowsze", "Warszawa"]

    private let minimumInvestments: [Int: Double] = [0: 200_000, 1: 400_000, 2: 10_000_000]

    private var intensity: Double {
        switch (region, companySize) {
        case (0, 0): return 70
        case (0, 1): return 60
        case (0, 2): return 50
        case (1, 0): return 55
        case (1, 1): return 45
        case (1, 2): return 35
        case (2, 0): return 30
        case (2, 1): return 20
        case (2, 2): return 10
        default: return 0
        }
    }

    private var investmentValue: Double {
        Double(investmentText.replacingOccurrences(of: " ", with: "")) ?? 0
    }

    private var annualIncome: Double {
        Double(annualIncomeText.replacingOccurrences(of: " ", with: "")) ?? 0
    }

    private var maxRelief: Double {
        investmentValue * intensity / 100
    }

    private var annualTax: Double {
        annualIncome * 0.19
    }

    private var yearsOfRelief: Int {
        guard annualTax > 0 else { return 0 }
        return min(15, Int(ceil(maxRelief / annualTax)))
    }

    private var minimumInvestment: Double {
        minimumInvestments[companySize] ?? 200_000
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Dane wejściowe")
                        .font(.headline)
                        .foregroundColor(.secondary)

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Wartość inwestycji (PLN)")
                            .font(.subheadline)
                            .fontWeight(.medium)
                        TextField("np. 1 000 000", text: $investmentText)
                            .keyboardType(.numberPad)
                            .padding(10)
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(8)
                    }

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Wielkość firmy")
                            .font(.subheadline)
                            .fontWeight(.medium)
                        Picker("Wielkość firmy", selection: $companySize) {
                            ForEach(0..<companySizes.count, id: \.self) { i in
                                Text(companySizes[i]).tag(i)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Region")
                            .font(.subheadline)
                            .fontWeight(.medium)
                        Picker("Region", selection: $region) {
                            ForEach(0..<regions.count, id: \.self) { i in
                                Text(regions[i]).tag(i)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Roczny dochód do opodatkowania (PLN)")
                            .font(.subheadline)
                            .fontWeight(.medium)
                        TextField("np. 500 000", text: $annualIncomeText)
                            .keyboardType(.numberPad)
                            .padding(10)
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(8)
                    }
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.06), radius: 6, x: 0, y: 2)

                VStack(alignment: .leading, spacing: 12) {
                    Text("Wyniki")
                        .font(.headline)
                        .foregroundColor(.secondary)

                    CalcResultCard(
                        label: "Intensywność pomocy",
                        value: "\(Int(intensity))%",
                        color: brandBlue,
                        icon: "percent"
                    )

                    CalcResultCard(
                        label: "Maksymalne zwolnienie podatkowe",
                        value: formatPLN(maxRelief),
                        color: .green,
                        icon: "banknote"
                    )

                    CalcResultCard(
                        label: "Szacowany okres zwolnienia",
                        value: annualTax > 0 ? "\(yearsOfRelief) lat" : "–",
                        color: .purple,
                        icon: "calendar"
                    )

                    CalcResultCard(
                        label: "Minimalna wymagana inwestycja",
                        value: formatPLN(minimumInvestment),
                        color: .orange,
                        icon: "chart.bar.fill"
                    )
                }

                Text("* Wyniki mają charakter szacunkowy. Skontaktuj się z nami po dokładną analizę.")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.bottom, 24)
            }
            .padding()
        }
    }
}

struct BGKCalculatorView: View {
    var brandBlue: Color

    @State private var loanAmountText: String = ""
    @State private var creditType: Int = 0
    @State private var creditPurpose: Int = 0

    private let creditTypes = ["Inwestycyjny", "Obrotowy"]
    private let creditPurposes = ["Innowacje / B+R", "Cyfryzacja", "Efektywność energetyczna", "Zielone inwestycje", "Inne"]

    private var loanAmount: Double {
        Double(loanAmountText.replacingOccurrences(of: " ", with: "")) ?? 0
    }

    private var guaranteeAmount: Double {
        loanAmount * 0.80
    }

    private var capitalGrant: Double {
        creditType == 0 ? loanAmount * 0.15 : 0
    }

    private var interestGrant: Double {
        loanAmount * 0.05 * 1
    }

    private var totalSupport: Double {
        guaranteeAmount + capitalGrant + interestGrant
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Dane wejściowe")
                        .font(.headline)
                        .foregroundColor(.secondary)

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Kwota kredytu (PLN)")
                            .font(.subheadline)
                            .fontWeight(.medium)
                        TextField("np. 2 000 000", text: $loanAmountText)
                            .keyboardType(.numberPad)
                            .padding(10)
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(8)
                    }

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Rodzaj kredytu")
                            .font(.subheadline)
                            .fontWeight(.medium)
                        Picker("Rodzaj kredytu", selection: $creditType) {
                            ForEach(0..<creditTypes.count, id: \.self) { i in
                                Text(creditTypes[i]).tag(i)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Cel kredytu")
                            .font(.subheadline)
                            .fontWeight(.medium)
                        Picker("Cel kredytu", selection: $creditPurpose) {
                            ForEach(0..<creditPurposes.count, id: \.self) { i in
                                Text(creditPurposes[i]).tag(i)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .padding(10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                    }
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.06), radius: 6, x: 0, y: 2)

                VStack(alignment: .leading, spacing: 12) {
                    Text("Wyniki")
                        .font(.headline)
                        .foregroundColor(.secondary)

                    CalcResultCard(
                        label: "Kwota gwarancji (80% kredytu)",
                        value: formatPLN(guaranteeAmount),
                        color: Color(red: 0.2, green: 0.6, blue: 0.9),
                        icon: "shield.checkered"
                    )

                    CalcResultCard(
                        label: "Szacowana dotacja do kapitału",
                        value: formatPLN(capitalGrant),
                        color: .green,
                        icon: "banknote"
                    )

                    CalcResultCard(
                        label: "Szacowana dotacja do odsetek (12 m-cy)",
                        value: formatPLN(interestGrant),
                        color: .orange,
                        icon: "arrow.down.circle"
                    )

                    CalcResultCard(
                        label: "Łączna wartość wsparcia",
                        value: formatPLN(totalSupport),
                        color: .purple,
                        icon: "sum"
                    )
                }

                Text("* Wyniki mają charakter szacunkowy. Skontaktuj się z nami po dokładną analizę.")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.bottom, 24)
            }
            .padding()
        }
    }
}

struct CalcResultCard: View {
    let label: String
    let value: String
    let color: Color
    let icon: String

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(color)
                .frame(width: 36)

            VStack(alignment: .leading, spacing: 4) {
                Text(label)
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(value)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(color)
            }

            Spacer()
        }
        .padding()
        .background(color.opacity(0.08))
        .cornerRadius(12)
    }
}

#Preview {
    CalculatorView(brandBlue: Color(red: 0.2, green: 0.6, blue: 0.9))
}
