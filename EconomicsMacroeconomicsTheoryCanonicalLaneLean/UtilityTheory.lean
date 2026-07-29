import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMacroeconomicsTheoryCanonicalLaneLean

structure UtilityTheoryPackage where
  consumptionSet : Type u
  preferenceRelation : Type v
  utilityFunction : Type w
  completeness : Prop
  transitivity : Prop
  continuity : Prop

structure UtilityTheoryEvidence (U : UtilityTheoryPackage) where
  completenessClosed : U.completeness
  transitivityClosed : U.transitivity
  continuityClosed : U.continuity

def UtilityTheoryClosed (U : UtilityTheoryPackage) : Prop :=
  U.completeness ∧ U.transitivity ∧ U.continuity

theorem utility_theory_closed_from_evidence
    (U : UtilityTheoryPackage) (E : UtilityTheoryEvidence U) :
    UtilityTheoryClosed U := by
  exact And.intro E.completenessClosed (And.intro E.transitivityClosed E.continuityClosed)

end EconomicsMacroeconomicsTheoryCanonicalLaneLean
end HautevilleHouse