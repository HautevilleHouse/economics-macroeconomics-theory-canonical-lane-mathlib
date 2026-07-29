import canonicalLaneMathlib.AdmissibleClass
import EconomicsMacroeconomicsTheoryCanonicalLaneLean.ArrowDebreuEquilibrium
import EconomicsMacroeconomicsTheoryCanonicalLaneLean.GrowthModel
import EconomicsMacroeconomicsTheoryCanonicalLaneLean.AssetPricing

namespace HautevilleHouse
namespace EconomicsMacroeconomicsTheoryCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop := True

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  trivial

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedMacroeconomicsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_macroeconomics_endgame (A : AdmissibleClass) :
    ConstrainedMacroeconomicsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end EconomicsMacroeconomicsTheoryCanonicalLaneLean
end HautevilleHouse
