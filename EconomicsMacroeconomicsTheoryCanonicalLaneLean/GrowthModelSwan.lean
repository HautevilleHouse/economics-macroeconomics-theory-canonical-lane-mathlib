import EconomicsMacroeconomicsTheoryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMacroeconomicsTheoryCanonicalLaneLean

structure SolowSwanGrowthPackage where
  capitalAccumulation : Prop
  laborGrowth : Prop
  productionFunction : Prop
  steadyState : Prop
  convergence : Prop

structure SolowSwanEvidence (G : SolowSwanGrowthPackage) where
  capitalAccumulationClosed : G.capitalAccumulation
  laborGrowthClosed : G.laborGrowth
  productionFunctionClosed : G.productionFunction
  steadyStateClosed : G.steadyState
  convergenceClosed : G.convergence

def SolowSwanGrowthClosed (G : SolowSwanGrowthPackage) : Prop :=
  G.capitalAccumulation ∧ G.laborGrowth ∧ G.productionFunction ∧ G.steadyState ∧ G.convergence

theorem solow_swan_growth_closed (G : SolowSwanGrowthPackage) (E : SolowSwanEvidence G) : SolowSwanGrowthClosed G := by
  exact And.intro E.capitalAccumulationClosed (And.intro E.laborGrowthClosed (And.intro E.productionFunctionClosed (And.intro E.steadyStateClosed E.convergenceClosed)))

end EconomicsMacroeconomicsTheoryCanonicalLaneLean
end HautevilleHouse