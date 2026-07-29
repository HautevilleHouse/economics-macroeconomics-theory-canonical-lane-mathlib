import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMacroeconomicsTheoryCanonicalLaneLean

structure ArrowDebreuEquilibrium where
  commoditySpace : Type u
  consumerSet : Type v
  productionSet : Type w
  priceSystem : commoditySpace → ℝ
  allocation : consumerSet → commoditySpace × ℕ
  productionPlan : productionSet → commoditySpace
  feasibilityCondition : ∀ (x : commoditySpace), (∑_{c : consumerSet} (allocation c).1) ;+ (∑_{p : productionSet} productionPlan p) = x
  zeroProfitCondition : ∀ (p : productionSet), priceSystem (productionPlan p) = 0
  utilityMaximization : ∀ (c : consumerSet), (allocation c).2 = 0
  paretoOptimality : Prop

structure ArrowDebreuEvidence (E : ArrowDebreuEquilibrium) where
  feasibilityConditionClosed : E.feasibilityCondition
  zeroProfitConditionClosed : E.zeroProfitCondition
  utilityMaximizationClosed : E.utilityMaximization
  paretoOptimalityClosed : E.paretoOptimality

def ArrowDebreuEquilibriumClosed (E : ArrowDebreuEquilibrium) : Prop := 
  E.feasibilityCondition ∧ E.zeroProfitCondition ∧ E.utilityMaximization ∧ E.paretoOptimality

theorem arrow_debreu_closed_from_evidence (E : ArrowDebreuEquilibrium) (Ev : ArrowDebreuEvidence E) :
    ArrowDebreuEquilibriumClosed E :=
  And.intro Ev.feasibilityConditionClosed (And.intro Ev.zeroProfitConditionClosed (And.intro Ev.utilityMaximizationClosed Ev.paretoOptimalityClosed))

end EconomicsMacroeconomicsTheoryCanonicalLaneLean
end HautevilleHouse
