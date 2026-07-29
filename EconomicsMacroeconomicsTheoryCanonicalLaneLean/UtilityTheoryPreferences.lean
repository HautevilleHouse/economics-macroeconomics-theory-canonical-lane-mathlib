import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMacroeconomicsTheoryCanonicalLaneLean

structure PreferenceRelation (A : Type) where
  agent : A
  totalPreorder : A → A → Prop
  completeness : ∀ x y : A, totalPreorder x y ∨ totalPreorder y x
  transitivity : ∀ x y z : A, totalPreorder x y → totalPreorder y z → totalPreorder x z

structure UtilityRepresentation (A : Type) (P : PreferenceRelation A) where
  utility : A → ℝ
  preservesOrder : ∀ x y : A, P.totalPreorder x y ↔ utility x ≤ utility y

structure UtilityPackage (A : Type) where
  agentType : Type
  pref : PreferenceRelation agentType
  continuousPref : Prop
  utilityExists : Prop

structure UtilityEvidence {A : Type} (U : UtilityPackage A) where
  continuousPrefClosed : U.continuousPref
  utilityExistsClosed : U.utilityExists

def UtilityClosed {A : Type} (U : UtilityPackage A) : Prop :=
  U.continuousPref ∧ U.utilityExists

theorem utility_closed_from_evidence {A : Type} (U : UtilityPackage A) (E : UtilityEvidence U) : UtilityClosed U :=
  And.intro E.continuousPrefClosed E.utilityExistsClosed

end EconomicsMacroeconomicsTheoryCanonicalLaneLean
end HautevilleHouse