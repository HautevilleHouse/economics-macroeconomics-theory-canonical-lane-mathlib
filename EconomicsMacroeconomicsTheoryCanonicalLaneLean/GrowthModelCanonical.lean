import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMacroeconomicsTheoryCanonicalLaneLean

structure GrowthModelParameters where
  discountFactor : ℝ
  capitalShare : ℝ
  depreciationRate : ℝ
  technologyParameter : ℝ
  populationGrowthRate : ℝ
  positiveParameters : discountFactor > 0 ∧ capitalShare > 0 ∧ depreciationRate > 0 ∧ technologyParameter > 0

structure OptimalGrowthPath where
  capitalSequence : ℕ → ℝ
  consumptionSequence : ℕ → ℝ
  eulerEquation : Prop
  transversalityCondition : Prop
  steadyStateCapital : ℝ
  steadyStateConsumption : ℝ

structure GrowthModelPackage (P : GrowthModelParameters) where
  growthPath : OptimalGrowthPath
  existenceOptimalPath : Prop
  uniquenessOptimalPath : Prop
  stabilitySteadyState : Prop

def GrowthModelClosed {P : GrowthModelParameters} (G : GrowthModelPackage P) : Prop :=
  G.existenceOptimalPath ∧ G.uniquenessOptimalPath ∧ G.stabilitySteadyState

structure GrowthModelEvidence {P : GrowthModelParameters} (G : GrowthModelPackage P) where
  existenceClosed : G.existenceOptimalPath
  uniquenessClosed : G.uniquenessOptimalPath
  stabilityClosed : G.stabilitySteadyState

theorem growth_model_closed_from_evidence {P : GrowthModelParameters}
    (G : GrowthModelPackage P) (E : GrowthModelEvidence G) :
    GrowthModelClosed G := by
  exact And.intro E.existenceClosed (And.intro E.uniquenessClosed E.stabilityClosed)

end EconomicsMacroeconomicsTheoryCanonicalLaneLean
end HautevilleHouse