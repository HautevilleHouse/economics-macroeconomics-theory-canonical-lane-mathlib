import EconomicsMacroeconomicsTheoryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMacroeconomicsTheoryCanonicalLaneLean

structure CAPMPricingPackage where
  riskFreeRate : Prop
  marketPortfolio : Prop
  betaCoefficient : Prop
  expectedReturn : Prop
  securityMarketLine : Prop

structure CAPMEvidence (C : CAPMPricingPackage) where
  riskFreeRateClosed : C.riskFreeRate
  marketPortfolioClosed : C.marketPortfolio
  betaCoefficientClosed : C.betaCoefficient
  expectedReturnClosed : C.expectedReturn
  securityMarketLineClosed : C.securityMarketLine

def CAPMPricingClosed (C : CAPMPricingPackage) : Prop :=
  C.riskFreeRate ∧ C.marketPortfolio ∧ C.betaCoefficient ∧ C.expectedReturn ∧ C.securityMarketLine

theorem capm_pricing_closed (C : CAPMPricingPackage) (E : CAPMEvidence C) : CAPMPricingClosed C := by
  exact And.intro E.riskFreeRateClosed (And.intro E.marketPortfolioClosed (And.intro E.betaCoefficientClosed (And.intro E.expectedReturnClosed E.securityMarketLineClosed)))

end EconomicsMacroeconomicsTheoryCanonicalLaneLean
end HautevilleHouse