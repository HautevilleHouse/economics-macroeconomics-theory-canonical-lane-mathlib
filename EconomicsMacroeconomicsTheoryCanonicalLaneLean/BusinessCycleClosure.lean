import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMacroeconomicsTheoryCanonicalLaneLean

structure RealBusinessCycleParameters where
  productivityShock : Type u
  laborSupplyElasticity : ℝ
  intertemporalSubstitutionElasticity : ℝ
  capitalAdjustmentCost : ℝ
  positiveElasticities : laborSupplyElasticity > 0 ∧ intertemporalSubstitutionElasticity > 0

structure BusinessCycleDynamics where
  outputProcess : ℕ → ℝ
  employmentProcess : ℕ → ℝ
  investmentProcess : ℕ → ℝ
  consumptionProcess : ℕ → ℝ
  productivityProcess : ℕ → ℝ
  productivityEvolution : ℕ → ℝ → ℝ
  optimalLaborSupply : Prop
  optimalConsumption : Prop
  equilibriumConditions : Prop

structure BusinessCyclePackage where
  parameters : RealBusinessCycleParameters
  dynamics : BusinessCycleDynamics
  calibrationData : Prop
  replicationBusinessCycleFacts : Prop
  policyImplications : Prop

def BusinessCycleClosed (B : BusinessCyclePackage) : Prop :=
  B.replicationBusinessCycleFacts ∧ B.policyImplications

structure BusinessCycleEvidence (B : BusinessCyclePackage) where
  replicationClosed : B.replicationBusinessCycleFacts
  policyClosed : B.policyImplications

theorem business_cycle_closed_from_evidence (B : BusinessCyclePackage) (E : BusinessCycleEvidence B) :
    BusinessCycleClosed B := by
  exact And.intro E.replicationClosed E.policyClosed

end EconomicsMacroeconomicsTheoryCanonicalLaneLean
end HautevilleHouse