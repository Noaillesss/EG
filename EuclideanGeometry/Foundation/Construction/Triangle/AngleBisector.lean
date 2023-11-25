import EuclideanGeometry.Foundation.Axiom.Position.Angle
import EuclideanGeometry.Foundation.Axiom.Position.Angle_ex
import EuclideanGeometry.Foundation.Axiom.Position.Angle_trash
import EuclideanGeometry.Foundation.Axiom.Linear.Perpendicular
import EuclideanGeometry.Foundation.Axiom.Triangle.Basic
import EuclideanGeometry.Foundation.Axiom.Circle.Basic

import EuclideanGeometry.Foundation.Axiom.Basic.Angle_trash
/-!

-/
noncomputable section
namespace EuclidGeom

variable {P : Type _} [EuclideanPlane P]

-- Feel free to change the name of the theorems and comments into better ones, or add sections to better organize theorems.
-- `Currently, the theorems are not well-organized, please follow the plan file to write and add theorems in this file into the plan file if they are not already in the plan`

-- we don't need to put the following definitions in the namespace Angle, since we will certainly not use it in the form of `ang.IsBis ray`
-- if only one condition is used, please change `structure : Prop` back to `def : Prop`, if more than one condition is used, please name each condition under structure, please do not use `∧`.



structure IsAngBis (ang : Angle P) (ray : Ray P) : Prop where
  eq_source : ang.source = ray.source
  eq_value : (Angle.mk_strat_ray ang ray eq_source).value = (Angle.mk_ray_end ang ray eq_source).value
  same_sgn : ((Angle.mk_strat_ray ang ray eq_source).value.IsPos ∧ (Angle.mk_ray_end ang ray eq_source).value.IsPos) ∨ ((Angle.mk_strat_ray ang ray eq_source).value.IsNeg ∧ (Angle.mk_ray_end ang ray eq_source).value.IsNeg) ∨ ((Angle.mk_strat_ray ang ray eq_source).value.toReal = 2⁻¹ * π )

structure IsAngBisLine (ang : Angle P) (line : Line P) : Prop where
  source_on : ang.source LiesOn line

structure IsExAngBis

structure IsExAngBiscetorLine

namespace Angle


/- when the Angle is flat, bis is on the left side-/
def AngBis (ang : Angle P) : Ray P where
  source := ang.source
  toDir := ang.start_ray.toDir * (2⁻¹ * ang.value.toReal).toAngValue.toDir

def AngBisLine (ang : Angle P) : Line P := ang.AngBis.toLine

def ExAngBis (ang : Angle P) : Ray P where
  source := ang.source
  toDir := ang.start_ray.toDir * (2⁻¹ * ang.value.toReal + 2⁻¹ * π).toAngValue.toDir

def ExAngBisLine (ang : Angle P) : Line P := ang.ExAngBis.toLine

end Angle

namespace Angle

theorem angbis_is_angbis (ang : Angle P) : IsAngBis ang ang.AngBis where
  eq_source := rfl
  eq_value := by
    have h : ang.source = ang.AngBis.source := rfl
    rw [mk_strat_ray_value_eq_angdiff ang ang.AngBis h]
    rw [mk_ray_end_value_eq_angdiff ang ang.AngBis h]
    rw [Dir.AngDiff]
    rw [Dir.AngDiff]
    rw [← dir_eq_of_angvalue_eq]
    rw [AngBis]
    rw [end_ray_eq_start_ray_mul_value]
    simp
    rw [← sub_todir_eq_todir_div]
    rw [theta_sub_half_theta_eq_half_theta ang.value]
  same_sgn := by
    sorry


theorem angbisline_is_angbisline : sorry := sorry

theorem exangbis_is_exangbis : sorry := sorry

theorem exangbisline_is_exangbisline : sorry := sorry

end Angle

/-definition property: lies on the bis means bisect the angle-/
theorem lie_on_angbis (ang: Angle P) (A : P): sorry := sorry

/- underlying line of bis as the locus satisfying the sum of distance to each ray of the angle is 0 -/
theorem lie_on_angbisline_of_distance_zero (ang: Angle P) : sorry := sorry

theorem lie_on_angbis_of_lie_on_angbisline_inside_angle (ang : Angle P)  : sorry := sorry

/-bis lies inside the angle-/

/-construct the intercentor as the intersection of two bis-/

/-a triangle_nd admit an unique intercenter-/


structure IsIncenter (tri_nd : Triangle_nd P) (I : P) : Prop where

structure IsExcenter1 (tri_nd : Triangle_nd P) (E : P) : Prop where

structure IsIncircle (tri_nd : Triangle_nd P) (cir : Circle P) : Prop where

structure IsExcircle1 (tri_nd : Triangle_nd P) (cir : Circle P) : Prop where

namespace Triangle_nd

def Incenter (tri_nd : Triangle_nd P) : P := sorry

def Excenter1 (tri_nd : Triangle_nd P) : P := sorry

def Incircle (tri_nd : Triangle_nd P) : Circle P := sorry

def Excircle1 (tri_nd : Triangle_nd P) : Circle P := sorry

end Triangle_nd

namespace Triangle_nd

theorem incenter_is_incenter : sorry := sorry

theorem excenter1_is_excenter1 : sorry := sorry

theorem incircle_is_incircle : sorry := sorry

theorem excircle1_is_excircle1 : sorry := sorry

end Triangle_nd

/-the intercenter lies inside of the triangle-/

theorem incenter_lies_int_triangle (triangle_nd : Triangle_nd P): sorry := sorry

end EuclidGeom
