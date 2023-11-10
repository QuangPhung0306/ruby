//for flow rate
function convertToSiFlowRate(infinitive_value) {
  if ($.isNumeric(infinitive_value)) {
    return infinitive_value * 1.699;
  } else {
    return infinitive_value;
  }
}

function convertToIpFlowRate(infinitive_value) {
  if ($.isNumeric(infinitive_value)) {
    return infinitive_value / 1.699;
  } else {
    return infinitive_value;
  }
}

function valueFlowRateToSetElement(infinitive_value) {
  if (calculation_mode) {
    return infinitive_value;
  } else {
    return convertToIpFlowRate(infinitive_value);
  }
}

function valueFlowRateToSetGlobal(infinitive_value) {
  if (calculation_mode) {
    return infinitive_value;
  } else {
    return convertToSiFlowRate(infinitive_value);
  }
}

//for temperature
function convertToSiTemperature(infinitive_value) {
  if ($.isNumeric(infinitive_value)) {
    return (infinitive_value - 32) / 1.8;
  } else {
    return infinitive_value;
  }
}

function convertToIpTemperature(infinitive_value) {
  if ($.isNumeric(infinitive_value)) {
    return infinitive_value * 1.8 + 32;
  } else {
    return infinitive_value
  }
}

function valueTemperatureToSetElement(infinitive_value) {
  if (calculation_mode) {
    return infinitive_value;
  } else {
    return convertToIpTemperature(infinitive_value);
  }
}

function valueTemperatureToSetGlobal(infinitive_value) {
  if (calculation_mode) {
    return infinitive_value;
  } else {
    return convertToSiTemperature(infinitive_value);
  }
}

//for absolute_humidity
function convertToSiAbsoluteHumidity(infinitive_value) {
  if ($.isNumeric(infinitive_value)) {
    return infinitive_value / 7;
  } else {
    return infinitive_value
  }
}

function convertToIpAbsoluteHumidity(infinitive_value) {
  if ($.isNumeric(infinitive_value)) {
    return infinitive_value * 7;
  } else {
    return infinitive_value;
  }
}

function valueAbsoluteHumidityToSetElement(infinitive_value) {
  if (calculation_mode) {
    return infinitive_value;
  } else {
    return convertToIpAbsoluteHumidity(infinitive_value);
  }
}

function valueAbsoluteHumidityToSetGlobal(infinitive_value) {
  if (calculation_mode) {
    return infinitive_value;
  } else {
    return convertToSiAbsoluteHumidity(infinitive_value);
  }
}

//for cooler
function convertToSiCooler(infinitive_value) {
  if ($.isNumeric(infinitive_value)) {
    return infinitive_value * 0.29307107 / 1000;
  } else {
    return infinitive_value;
  }
}

function convertToIpCooler(infinitive_value) {
  if ($.isNumeric(infinitive_value)) {
    return infinitive_value * 1000 / 0.29307107;
  } else {
    return infinitive_value;
  }
}

function valueCoolerToSetElement(infinitive_value) {
  if (calculation_mode) {
    return infinitive_value;
  } else {
    return convertToIpCooler(infinitive_value);
  }
}

function valueCoolerToSetGlobal(infinitive_value) {
  if (calculation_mode) {
    return infinitive_value;
  } else {
    return convertToSiCooler(infinitive_value);
  }
}

//for heater_power 
function convertToSiHeaterPower(infinitive_value) {
  if ($.isNumeric(infinitive_value)) {
    return infinitive_value / 2.204623;
  } else {
    return infinitive_value;
  }
}

function convertToIpHeaterPower(infinitive_value) {
  if ($.isNumeric(infinitive_value)) {
    return infinitive_value * 2.204623;
  } else {
    return infinitive_value;
  }
}

function valueHeaterPowerToSetElement(infinitive_value) {
  if (calculation_mode) {
    return infinitive_value;
  } else {
    return convertToIpHeaterPower(infinitive_value);
  }
}

function valueHeaterPowerToSetGlobal(infinitive_value) {
  if (calculation_mode) {
    return infinitive_value;
  } else {
    return convertToSiHeaterPower(infinitive_value);
  }
}

//water flow
function convertToSiWaterFlow(infinitive_value) {
  if ($.isNumeric(infinitive_value)) {
    return infinitive_value / 2.119;
  } else {
    return infinitive_value;
  }
}

function convertToIpWaterFlow(infinitive_value) {
  if ($.isNumeric(infinitive_value)) {
    return infinitive_value * 2.119;
  } else {
    return infinitive_value;
  }
}

function valueWaterFlowToSetElement(infinitive_value) {
  if (calculation_mode) {
    return infinitive_value;
  } else {
    return convertToIpWaterFlow(infinitive_value);
  }
}

function valueWaterFlowToSetGlobal(infinitive_value) {
  if (calculation_mode) {
    return infinitive_value;
  } else {
    return convertToSiWaterFlow(infinitive_value);
  }
}
