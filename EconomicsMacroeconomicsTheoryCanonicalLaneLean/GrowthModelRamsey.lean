import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMacroeconomicsTheoryCanonicalLaneLean

structure MacroeconomicAggregates where
  capital : Type
  labor : Type
  output : Type

structure ProductionFunction (M : MacroeconomicAggregates) where
  totalFactorProductivity : ℝ
  capitalElasticity : ℝ
  outputLevel : M.capital → M.labor → ℝ
  concave : Prop
  constantReturns : Prop

structure RamseyModel (M : MacroeconomicAggregates) (P : ProductionFunction M) where
  discountRate : ℝ
  intertemporalElasticity : ℝ
  capitalAccumulation : M.capital → M.capital → Prop
  householdOptimization : Prop
  balancedGrowthPath : Prop

structure RamseyEvidence {M : MacroeconomicAggregates} {P : ProductionFunction M} (R : RamseyModel M P) where
  householdOptimizationClosed : R.householdOptimization
  balancedGrowthPathClosed : R.balancedGrowthPath

def RamseyClosed {M : MacroeconomicAggregates} {P : ProductionFunction M} (R : RamseyModel M P) : Prop :=
  R.householdOptimization ∧ R.balancedGrowthPath

theorem ramsey_closed_from_evidence {M : MacroeconomicAggregates} {P : ProductionFunction M} (R : RamseyModel M P) (E : RamseyEvidence R) : RamseyClosed R :=
  And.intro E.householdOptimizationClosed E.balancedGrowthPathClosed

end EconomicsMacroeconomicsTheoryCanonicalLaneLean
end HautevilleHouse