import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMacroeconomicsTheoryCanonicalLaneLean

structure LucasAssetPricingModel where
  endowmentProcess : ℕ → ℝ
  representativeAgent : (ℝ → ℝ) → ℝ
  discountFactor : ℝ
  pricingEquation : ℕ → ℝ
  rationalExpectationsCondition : ∀ t : ℕ, pricingEquation t = discountFactor * (pricingEquation (t+1) + endowmentProcess (t+1)).expectation
  marketClearing : ∀ t : ℕ, (pricingEquation t).supply = 1
  equilibriumExists : Prop

structure AssetPricingEvidence (L : LucasAssetPricingModel) where
  rationalExpectationsConditionClosed : L.rationalExpectationsCondition
  marketClearingClosed : L.marketClearing
  equilibriumExistsClosed : L.equilibriumExists

def AssetPricingModelClosed (L : LucasAssetPricingModel) : Prop :=
  L.rationalExpectationsCondition ∧ L.marketClearing ∧ L.equilibriumExists

theorem asset_pricing_closed_from_evidence (L : LucasAssetPricingModel) (Ev : AssetPricingEvidence L) :
    AssetPricingModelClosed L :=
  And.intro Ev.rationalExpectationsConditionClosed (And.intro Ev.marketClearingClosed Ev.equilibriumExistsClosed)

end EconomicsMacroeconomicsTheoryCanonicalLaneLean
end HautevilleHouse
