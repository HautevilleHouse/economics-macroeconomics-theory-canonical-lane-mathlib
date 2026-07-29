import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMacroeconomicsTheoryCanonicalLaneLean

structure MonetaryPolicyRule where
  inflationTarget : ℝ
  outputGapCoefficient : ℝ
  inflationCoefficient : ℝ
  interestRateSmoothing : ℝ
  naturalRate : ℝ
  ruleCoefficientsPositive : inflationCoefficient > 0 ∧ outputGapCoefficient > 0

structure TaylorRuleModel where
  rule : MonetaryPolicyRule
  nominalInterestRate : ℕ → ℝ
  inflationRate : ℕ → ℝ
  outputGap : ℕ → ℝ
  taylorPrincipleSatisfied : Prop
  determinacyCondition : Prop

def inflationTargetDeviation (i : ℕ) (model : TaylorRuleModel) : ℝ :=
  model.inflationRate i - model.rule.inflationTarget

def outputGapDeviation (i : ℕ) (model : TaylorRuleModel) : ℝ :=
  model.outputGap i

def taylorRuleInterestRate (i : ℕ) (model : TaylorRuleModel) : ℝ :=
  model.rule.naturalRate
  + model.rule.inflationCoefficient * inflationTargetDeviation i model
  + model.rule.outputGapCoefficient * outputGapDeviation i model

structure MonetaryPolicyPackage where
  model : TaylorRuleModel
  equilibriumUnique : Prop
  inflationAnchored : Prop
  welfareOptimal : Prop

def MonetaryPolicyClosed (M : MonetaryPolicyPackage) : Prop :=
  M.equilibriumUnique ∧ M.inflationAnchored ∧ M.welfareOptimal

structure MonetaryPolicyEvidence (M : MonetaryPolicyPackage) where
  equilibriumClosed : M.equilibriumUnique
  inflationClosed : M.inflationAnchored
  welfareClosed : M.welfareOptimal

theorem monetary_policy_closed_from_evidence (M : MonetaryPolicyPackage) (E : MonetaryPolicyEvidence M) :
    MonetaryPolicyClosed M := by
  exact And.intro E.equilibriumClosed (And.intro E.inflationClosed E.welfareClosed)

end EconomicsMacroeconomicsTheoryCanonicalLaneLean
end HautevilleHouse