import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMacroeconomicsTheoryCanonicalLaneLean

structure RamseyCassKoopmansModel where
  capitalPath : ℝ → ℝ
  consumptionPath : ℝ → ℝ
  initialCapital : ℝ
  productionFunction : ℝ → ℝ
  utilityFunction : ℝ → ℝ
  discountRate : ℝ
  lawOfMotion : ∀ t : ℝ, capitalPath (t+1) = productionFunction (capitalPath t) - consumptionPath t + (1 - 0.05) * capitalPath t
  eulerEquation : ∀ t : ℝ, utilityFunction.derivative (consumptionPath t) = (1 + productionFunction.derivative (capitalPath (t+1)) - 0.05) * utilityFunction.derivative (consumptionPath (t+1)) / (1 + discountRate)
  transversalityCondition : ∀ t : ℝ, utilityFunction.derivative (consumptionPath t) * capitalPath t = 0

structure RamseyEvidence (M : RamseyCassKoopmansModel) where
  lawOfMotionClosed : M.lawOfMotion
  eulerEquationClosed : M.eulerEquation
  transversalityConditionClosed : M.transversalityCondition

def RamseyModelClosed (M : RamseyCassKoopmansModel) : Prop :=
  M.lawOfMotion ∧ M.eulerEquation ∧ M.transversalityCondition

theorem ramsey_model_closed_from_evidence (M : RamseyCassKoopmansModel) (Ev : RamseyEvidence M) :
    RamseyModelClosed M :=
  And.intro Ev.lawOfMotionClosed (And.intro Ev.eulerEquationClosed Ev.transversalityConditionClosed)

end EconomicsMacroeconomicsTheoryCanonicalLaneLean
end HautevilleHouse
