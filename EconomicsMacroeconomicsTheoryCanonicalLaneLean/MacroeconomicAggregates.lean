import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMacroeconomicsTheoryCanonicalLaneLean

structure MacroeconomicAggregatesPackage where
  outputGap : Type u
  inflationRate : Type v
  unemploymentRate : Type w
  aggregateDemand : Prop
  aggregateSupply : Prop
  policyRule : Prop

structure MacroeconomicAggregatesEvidence (M : MacroeconomicAggregatesPackage) where
  aggregateDemandClosed : M.aggregateDemand
  aggregateSupplyClosed : M.aggregateSupply
  policyRuleClosed : M.policyRule

def MacroeconomicAggregatesClosed (M : MacroeconomicAggregatesPackage) : Prop :=
  M.aggregateDemand ∧ M.aggregateSupply ∧ M.policyRule

theorem macroeconomic_aggregates_closed_from_evidence
    (M : MacroeconomicAggregatesPackage) (E : MacroeconomicAggregatesEvidence M) :
    MacroeconomicAggregatesClosed M := by
  exact And.intro E.aggregateDemandClosed (And.intro E.aggregateSupplyClosed E.policyRuleClosed)

end EconomicsMacroeconomicsTheoryCanonicalLaneLean
end HautevilleHouse