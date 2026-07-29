import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMacroeconomicsTheoryCanonicalLaneLean

structure EconomicShock where
  shockType : Type
  persistence : ℝ
  variance : ℝ

structure RealBusinessCycleModel where
  productivityShock : EconomicShock
  laborSupplyElasticity : ℝ
  capitalAdjustmentCost : ℝ
  technologyProcess : ℝ → ℝ
  equilibriumDynamics : Prop
  shockPropagation : Prop

structure RBCEvidence (R : RealBusinessCycleModel) where
  equilibriumDynamicsClosed : R.equilibriumDynamics
  shockPropagationClosed : R.shockPropagation

def RBCClosed (R : RealBusinessCycleModel) : Prop :=
  R.equilibriumDynamics ∧ R.shockPropagation

theorem rbc_closed_from_evidence (R : RealBusinessCycleModel) (E : RBCEvidence R) : RBCClosed R :=
  And.intro E.equilibriumDynamicsClosed E.shockPropagationClosed

end EconomicsMacroeconomicsTheoryCanonicalLaneLean
end HautevilleHouse