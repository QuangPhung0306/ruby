class UnitSelectionResult < ApplicationRecord
  belongs_to :project, optional: true
  belongs_to :air_mixture_input, optional: true
  belongs_to :room_calculation_input, optional: true
  belongs_to :unit_selection_input, optional: true

  enum model_type: {room_calculation: 1, air_mixture: 2, unit_selection: 3}

  scope :by_ids, -> (ids){where id: ids}
  scope :by_air_mixture_ids, -> (air_mixture_ids){where air_mixture_input_id: air_mixture_ids}

  scope :without_project_id, ->{where project_id: nil}

  def convert_result_to_ip
    data_hash = {
      id: id,
      air_mixture_input_id: air_mixture_input_id,
      model_type: model_type,
      project_id: project_id,
      rotation: rotation,
      diameter: diameter,
      depth: depth,
      a_tp1: (a_tp1.to_f * 1.8 + 32).round(1).to_s,
      a_xp1: (a_xp1.to_f * 7).round(1).to_s,
      a_fp: (a_fp.to_f / 1.699).round(0).to_s,
      a_vp: (a_vp.to_f / 0.00508).round(1).to_s,
      f_tr1: (f_tr1.to_f * 1.8 + 32).round(1).to_s,
      f_xr1: (f_xr1.to_f * 7).round(1).to_s,
      f_fr: (f_fr.to_f / 1.699).round(0).to_s,
      f_vr: (f_vr.to_f / 0.00508).round(1).to_s,
      b_tp2: (b_tp2.to_f * 1.8 + 32).round(1).to_s,
      b_xp2: (b_xp2.to_f * 7).round(3).to_s,
      b_mr: (b_mr.to_f * 2.204623).round(2).to_s,
      d_tpu2: "-",
      g_tr2: (g_tr2.to_f * 1.8 + 32).round(1).to_s,
      g_xr2: (g_xr2.to_f * 7).round(1).to_s,
      hp: (hp.to_f * 1000 / 0.29307107).round(1).to_s,
      pp: (0.004015*pp.to_f).round(2).to_s,
      pr: (0.004015*pr.to_f).round(2).to_s,
      ppu: "-",
      margin: margin,
      h: h,
      i: i,
      j: j,
      k: k,
      l: l,
      m: m,
      status: status,
      smo_xp2: (smo_xp2.to_f * 7).round(3).to_s,
    }
    if ["Recusorb 1", "Recusorb 2"].include?(@combobox2)
      data_hash.merge!({
        d_tpu2: (d_tpu2.to_f * 1.8 + 32).round(1).to_s,
        ppu: (0.004015*ppu.to_f).round(2).to_s,
        margin: "-",
        smo_xp2: "-"
      })
    end
    UnitSelectionResult.new data_hash
  end
end
