import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMacroeconomicsTheoryCanonicalLaneLean

structure AssetPricingModel where
  stateSpace : Type u
  probabilityMeasure : stateSpace → ℝ
  discountFactor : ℝ
  endowmentProcess : stateSpace → ℝ
  assetPayoffs : stateSpace → ℝ

def stochasticDiscountFactor (m : AssetPricingModel) : stateSpace → ℝ :=
  λ s => m.discountFactor * (m.endowmentProcess s)

def pricingKernel (m : AssetPricingModel) : stateSpace → ℝ :=
  stochasticDiscountFactor m

def assetPrice (m : AssetPricingModel) : ℝ :=
  λ s => m.assetPayoffs s * stochasticDiscountFactor m s

def noArbitrageCondition (m : AssetPricingModel) : Prop :=
  ∀ portfolio : stateSpace → ℝ, (∀ s, portfolio s ≥ 0) → assetPrice m portfolio > 0

structure AssetPricingPackage where
  model : AssetPricingModel
  noArbitrageHolds : Prop
  representativeAgentExists : Prop
  riskNeutralMeasureExists : Prop

def AssetPricingClosed (A : AssetPricingPackage) : Prop :=
  A.noArbitrageHolds ∧ A.representativeAgentExists ∧ A.riskNeutralMeasureExists

structure AssetPricingEvidence (A : AssetPricingPackage) where
  noArbitrageClosed : A.noArbitrageHolds
  representativeAgentClosed : A.representativeAgentExists
  riskNeutralMeasureClosed : A.riskNeutralMeasureExists

theorem asset_pricing_closed_from_evidence (A : AssetPricingPackage) (E : AssetPricingEvidence A) :
    AssetPricingClosed A := by
  exact And.intro E.noArbitrageClosed (And.intro E.representativeAgentClosed E.riskNeutralMeasureClosed)

end EconomicsMacroeconomicsTheoryCanonicalLaneLean
end HautevilleHouse