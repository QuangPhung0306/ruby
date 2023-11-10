function convert_comma_to_dot(value) {
  if(value == ""){return value;}
  value = parseFloat(value.replace(",", "."));
  return value;
}
function set_global_value(data_id, status, value){
    if (status == true) {
      if (data_id == "drc") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_moisture_content_drc = value;
        } else {
          r003_moisture_content_drc = value/7;
        }
      }
      if (data_id == "src") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_moisture_content_src = value;
        } else {
          r003_moisture_content_src = value/7;
        }
      }
      if (data_id == "odc") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_moisture_content_odc = value;
        } else {
          r003_moisture_content_odc = value/7;
        }
      }
      if (data_id == "vii-room-volume") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_room_volume_vii_tr = value;
        } else {
          r003_room_volume_vii_tr = value*0.0283168;
        }
      }
      if (data_id == "vii-room-tightness") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_room_tightness_vii_tr = value;
        } else {
          r003_room_tightness_vii_tr = value*1.699;
        }
      }
      if (data_id == "vii-door-and-or-air-lock") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_vii_infiltration_door_air_clock = value;
        } else {
          r003_vii_infiltration_door_air_clock = value*1.699;
        }
      }
      if (data_id == "vii-needed-airflow") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_vii_needed_airflow = value;
        } else {
          r003_vii_needed_airflow = value*1.699;
        }
      }
      if (data_id == "vii-total-ventilation-from-outdoor") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_vii_total_outdoor = value;
        } else {
          r003_vii_total_outdoor = value*1.699;
        }
      }
      if (data_id == "vii-total-ventilation-from-surrounding-rooms") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_vii_total_surrounding_rooms = value;
        } else {
          r003_vii_total_surrounding_rooms = value*1.699;
        }
      }
      if (data_id == "vii-percentage-leakage") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_vii_percentage = value;
        } else {
          r003_vii_percentage = value/7;
        }
      }
      if (data_id == "vii-total-load-from-ventilation") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_vii_total_load_ventilation = value;
        } else {
          r003_vii_total_load_ventilation = value/2.204623;
        }
      }
      if (data_id == "pitr") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_pitr = value;
        } else {
          r003_pitr = value/2.204623;
        }
      }
      if (data_id == "ows-pool-surface") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_ows_pool_surface = value;
        } else {
          r003_ows_pool_surface = value*0.092903;
        }
      }
      if (data_id == "ows-total-water-surface") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_total_water_surface = value;
        } else {
          r003_total_water_surface = value/2.204623;
        }
      }
      if (data_id == "pd") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_pd = value;
        } else {
          r003_pd = value/2.204623;
        }
      }
      if (data_id == "other") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_other = value;
        } else {
          r003_other = value/2.204623;
        }
      }
      if (data_id == "tml") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_tml = value;
        } else {
          r003_tml = value/2.204623;
        }
      }
      if (data_id == "cdej-corresponding-to") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_cdej_corresponding = value;
        } else {
          r003_cdej_corresponding = value/7;
        }
      }
      if (data_id == "cdej-ambient-air") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_cdej_ambient_air = value;
        } else {
          r003_cdej_ambient_air = value*1.699;
        }
      }
      if (data_id == "cdej-before-pre-cooler1") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_cdej_pre_cooler1 = value;
        } else {
          r003_cdej_pre_cooler1 = (value-32)/1.8;
        }
      }
      if (data_id == "cdej-before-pre-cooler2") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_cdej_pre_cooler2 = value;
        } else {
          r003_cdej_pre_cooler2 = value/7;
        }
      }
      if (data_id == "cdej-moisture-content") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_cdej_moisture_content = value;
        } else {
          r003_cdej_moisture_content = value/7;
        }
      }
      if (data_id == "b-total-dry-air-flow") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_fgh_total_airflow = value;
        } else {
          r003_fgh_total_airflow = value*1.699;
        }
      }
      if (data_id == "b-needed-moisture-content") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_b_needed_moisture_content = value;
        } else {
          r003_b_needed_moisture_content = value/7;
        }
      }
      if (data_id == "cdej-return-air-direct") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_cdej_return_air_direct = value;
        } else {
          r003_cdej_return_air_direct = value*1.699;
        }
      }
      if (data_id == "hgf-needed-moisture-content") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_hfg_needed_moisture_content = value;
        } else {
          r003_hfg_needed_moisture_content = value/7;
        }
      }
      if (data_id == "b-dry-air-temperature") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_b_dry_air_temperature = value;
        } else {
          r003_b_dry_air_temperature = (value-32)/1.8;
        }
      }
      if (data_id == "hgf-leakage") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_fgh_leakage = value;
        } else {
          r003_fgh_leakage = value*1.699;
        }
      }
      if (data_id == "b-heat-load") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_b_heat_load = value;
        } else {
          r003_b_heat_load = value*0.29307107/1000;
        }
      }
      if (data_id == "j_before_pre_cooler_degree_start") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_b120 = value;
        } else {
          r003_b120 = (value-32)/1.8;
        }
      }
      if (data_id == "j_before_pre_cooler_rate_start") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_b121 = value;
        } else {
          r003_b121 = value/7;
        }
      }
      if (data_id == "inlet_temperature_start") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_b124 = value;
        } else {
          r003_b124 = (value-32)/1.8;
        }
      }
      if (data_id == "inlet_moisture_content_start") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_b125 = value;
        } else {
          r003_b125 = value/7;
        }
      }
      if (data_id == "") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_base_atmospheric_pressure = value;
        } else {
          r003_base_atmospheric_pressure = value/7;
        }
      }
      if (data_id == "drc-temperature") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_b7 = value;
        } else {
          r003_b7 = (value-32)/1.8;
        }
      }
      if (data_id == "drc-relative-humidity") {
        r003_b8 = value;
      }
      if (data_id == "drc-atmospheric-pressure") {
        r003_b9 = value;
      }
      if (data_id == "odc-temperature") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_b13 = value;
        } else {
          r003_b13 = (value-32)/1.8;
        }
      }
      if (data_id == "odc-relative-humidity") {
        r003_b14 = value;
      }
      if (data_id == "odc-atmospheric-pressure") {
        r003_b15 = value;
      }
      if (data_id == "src-temperature") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_b19 = value;
        } else {
          r003_b19 = (value-32)/1.8;
        }
      }
      if (data_id == "src-relative-humidity") {
        r003_b20 = value;
      }
      if (data_id == "src-atmospheric-pressure") {
        r003_b21 = value;
      }
      if (data_id == "vii-room-length") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_b27 = value;
        } else {
          r003_b27 = value*0.91;
        }
      }
      if (data_id == "vii-room-width") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_b28 = value;
        } else {
          r003_b28 = value*0.91;
        }
      }
      if (data_id == "vii-room-height") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_b29 = value;
        } else {
          r003_b29 = value*0.91;
        }
      }
      if (data_id == "vii-door-height") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_b34 = value;
        } else {
          r003_b34 = value*0.91;
        }
      }
      if (data_id == "vii-door-width") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_c34 = value;
        } else {
          r003_c34 = value*0.91;
        }
      }
      if (data_id == "vii-air-lock-vestibule-height") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_b35 = value;
        } else {
          r003_b35 = value*0.91;
        }
      }
      if (data_id == "vii-air-lock-vestibule-width") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_c35 = value;
        } else {
          r003_c35 = value*0.91;
        }
      }
      if (data_id == "vii-air-lock-vestibule-length") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_d35 = value;
        } else {
          r003_d35 = value*0.91;
        }
      }
      if (data_id == "vii-wind-speed") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_b38 = value;
        } else {
          r003_b38 = value*0.00508;
        }
      }
      if (data_id == "vii-door-without-air-lock") {
        r003_b39 = value;
      }
      if (data_id == "vii-air-lock-vestibule") {
        r003_b40 = value;
      }
      if (data_id == "vii-open-holes") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_b43 = value;
        } else {
          r003_b43 = value*0.092903;
        }
      }
      if (data_id == "vii-mechanical-ventilation") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_b45 = value;
        } else {
          r003_b45 = value*1.699;
        }
      }
      if (data_id == "pitr-number-people") {
        r003_b52 = value;
      }
      if (data_id == "pitr-moisture-load") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_b53 = value;
        } else {
          r003_b53 = value/2.204623;
        }
      }
      if (data_id == "ows-pool-length") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_b57 = value;
        } else {
          r003_b57 = value*0.91;
        }
      }
      if (data_id == "ows-pool-width") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_b58 = value;
        } else {
          r003_b58 = value*0.91;
        }
      }
      if (data_id == "ows-water-temperature") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_b60 = value;
        } else {
          r003_b60 = (value-32)/1.8;
        }
      }
      if (data_id == "ows-vaporization-coefficient") {
        r003_b61 = value;
      }
      if (data_id == "pd-total-weight-product") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_b65 = value;
        } else {
          r003_b65 = value/2.204623;
        }
      }
      if (data_id == "pd-percentage-moisture") {
        r003_b66 = value/100;
      }
      if (data_id == "pd-percentage-dried") {
        r003_b67 = value/100;
      }
      if (data_id == "cdej-process-airflow") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_b88 = value;
        } else {
          r003_b88 = value*1.699;
        }
      }
      if (data_id == "cdej-pre-cooled-air") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_b90 = value;
        } else {
          r003_b90 = value*1.699;
        }
      }
      if (data_id == "cdej-pre-cooling-ambient") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_b91 = value;
        } else {
          r003_b91 = (value-32)/1.8;
        }
      }
      if (data_id == "cdej-pre-cooling-before") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_b96 = value;
        } else {
          r003_b96 = (value-32)/1.8;
        }
      }
      if (data_id == "cdej-temperature") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_b99 = value;
        } else {
          r003_b99 = (value-32)/1.8;
        }
      }
      if (data_id == "a-dr-model") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_b102 = value;
        } else {
          r003_b102 = value*1.699;
        }
      }
      if (data_id == "hgf-pre-cooling") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_b105 = value;
        } else {
          r003_b105 = value*1.699;
        }
      }
      if (data_id == "hgf-ambient") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_b106 = value;
        } else {
          r003_b106 = value*1.699;
        }
      }
      if (data_id == "b-total-dry-air-flow") {
        if ($("#r003_si_mode").is(":checked")) {
          r003_b112 = value;
        } else {
          r003_b112 = value*1.699;
        }
      }
    }
  }