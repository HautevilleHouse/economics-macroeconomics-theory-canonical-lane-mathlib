import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMacroeconomicsTheoryCanonicalLaneLean

structure MonetaryPolicyRule where
  inflationTarget : ℝ
  outputGapWeight : ℝ
  interestRateSmoothing : ℝ
  interestRateResponse : ℝ × ℝ → ℝ
  ruleImplemented : Prop
  stabilityGuarantee : Prop

structure InflationExpectations where
  adaptive : ℝ → ℝ
  rational : ℝ → ℝ

structure NewKeynesianModel (M : MonetaryPolicyRule) where
  phillipsCurveSlope : ℝ
  demandElasticity : ℝ
  monetaryTransmission : M.ruleImplemented → Prop
  equilibriumDeterminacy : Prop

structure NKEvidence {M : MonetaryPolicyRule} (N : NewKeynesianModel M) where
  equilibriumDeterminacyClosed : N.equilibriumDeterminacy

def NKClosed {M : MonetaryPolicyRule} (N : NewKeynesianModel M) : Prop :=
  N.equilibriumDeterminacy

theorem nk_closed_from_evidence {M : MonetaryPolicyRule} (N : NewKeynesianModel M) (E : NKEvidence N) : NKClosed N :=
  E.equilibriumDeterminacyClosed

end EconomicsMacroeconomicsTheoryCanonicalLaneLean
end HautevilleHouse