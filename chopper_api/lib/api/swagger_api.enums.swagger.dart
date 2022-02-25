import 'package:json_annotation/json_annotation.dart';

enum Sex {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('No')
  no,
  @JsonValue('Female')
  female,
  @JsonValue('Male')
  male
}

const $SexMap = {
  Sex.no: 'No',
  Sex.female: 'Female',
  Sex.male: 'Male',
  Sex.swaggerGeneratedUnknown: 'swaggerGeneratedUnknown'
};

enum Activity {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('Sedentary')
  sedentary,
  @JsonValue('LightlyActive')
  lightlyactive,
  @JsonValue('Active')
  active,
  @JsonValue('ModeratelyActive')
  moderatelyactive,
  @JsonValue('VeryActive')
  veryactive,
  @JsonValue('ExtraActive')
  extraactive,
  @JsonValue('ExtremelyActive')
  extremelyactive
}

const $ActivityMap = {
  Activity.sedentary: 'Sedentary',
  Activity.lightlyactive: 'LightlyActive',
  Activity.active: 'Active',
  Activity.moderatelyactive: 'ModeratelyActive',
  Activity.veryactive: 'VeryActive',
  Activity.extraactive: 'ExtraActive',
  Activity.extremelyactive: 'ExtremelyActive',
  Activity.swaggerGeneratedUnknown: 'swaggerGeneratedUnknown'
};

enum CaloriesFormulaId {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('None')
  none,
  @JsonValue('HarrisBenedict')
  harrisbenedict,
  @JsonValue('NewHarrisBenedict')
  newharrisbenedict,
  @JsonValue('MifflinSJeor')
  mifflinsjeor,
  @JsonValue('KetchMacArdl')
  ketchmacardl,
  @JsonValue('BodyArea')
  bodyarea,
  @JsonValue('WHO')
  who
}

const $CaloriesFormulaIdMap = {
  CaloriesFormulaId.none: 'None',
  CaloriesFormulaId.harrisbenedict: 'HarrisBenedict',
  CaloriesFormulaId.newharrisbenedict: 'NewHarrisBenedict',
  CaloriesFormulaId.mifflinsjeor: 'MifflinSJeor',
  CaloriesFormulaId.ketchmacardl: 'KetchMacArdl',
  CaloriesFormulaId.bodyarea: 'BodyArea',
  CaloriesFormulaId.who: 'WHO',
  CaloriesFormulaId.swaggerGeneratedUnknown: 'swaggerGeneratedUnknown'
};

enum ScenarioId {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('Safe')
  safe,
  @JsonValue('Desired')
  desired,
  @JsonValue('Extreme')
  extreme
}

const $ScenarioIdMap = {
  ScenarioId.safe: 'Safe',
  ScenarioId.desired: 'Desired',
  ScenarioId.extreme: 'Extreme',
  ScenarioId.swaggerGeneratedUnknown: 'swaggerGeneratedUnknown'
};

enum MicronutrientCountry {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('Russia')
  russia,
  @JsonValue('Canada')
  canada,
  @JsonValue('UK')
  uk,
  @JsonValue('USA')
  usa
}

const $MicronutrientCountryMap = {
  MicronutrientCountry.russia: 'Russia',
  MicronutrientCountry.canada: 'Canada',
  MicronutrientCountry.uk: 'UK',
  MicronutrientCountry.usa: 'USA',
  MicronutrientCountry.swaggerGeneratedUnknown: 'swaggerGeneratedUnknown'
};

enum WomanState {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('Normal')
  normal,
  @JsonValue('Pregnant')
  pregnant,
  @JsonValue('LactationFirst')
  lactationfirst,
  @JsonValue('LactationSecond')
  lactationsecond
}

const $WomanStateMap = {
  WomanState.normal: 'Normal',
  WomanState.pregnant: 'Pregnant',
  WomanState.lactationfirst: 'LactationFirst',
  WomanState.lactationsecond: 'LactationSecond',
  WomanState.swaggerGeneratedUnknown: 'swaggerGeneratedUnknown'
};

enum BmiCategory {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('Bmi0')
  bmi0,
  @JsonValue('Bmi1')
  bmi1,
  @JsonValue('Bmi2')
  bmi2,
  @JsonValue('Bmi3')
  bmi3,
  @JsonValue('Bmi4')
  bmi4,
  @JsonValue('Bmi5')
  bmi5,
  @JsonValue('Bmi6')
  bmi6
}

const $BmiCategoryMap = {
  BmiCategory.bmi0: 'Bmi0',
  BmiCategory.bmi1: 'Bmi1',
  BmiCategory.bmi2: 'Bmi2',
  BmiCategory.bmi3: 'Bmi3',
  BmiCategory.bmi4: 'Bmi4',
  BmiCategory.bmi5: 'Bmi5',
  BmiCategory.bmi6: 'Bmi6',
  BmiCategory.swaggerGeneratedUnknown: 'swaggerGeneratedUnknown'
};

enum ChartsType {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('Weight')
  weight,
  @JsonValue('Plan')
  plan,
  @JsonValue('Ideal')
  ideal,
  @JsonValue('Kd')
  kd,
  @JsonValue('Chest')
  chest,
  @JsonValue('Underchest')
  underchest,
  @JsonValue('Waist')
  waist,
  @JsonValue('Stomach')
  stomach,
  @JsonValue('Hips')
  hips,
  @JsonValue('Biceps')
  biceps,
  @JsonValue('Arm')
  arm,
  @JsonValue('Wrist')
  wrist,
  @JsonValue('Thigh')
  thigh,
  @JsonValue('Knee')
  knee,
  @JsonValue('Calf')
  calf,
  @JsonValue('Ankle')
  ankle,
  @JsonValue('Neck')
  neck,
  @JsonValue('Clothes')
  clothes,
  @JsonValue('Jeans')
  jeans,
  @JsonValue('Bmi')
  bmi,
  @JsonValue('Mr')
  mr,
  @JsonValue('Fatcalc')
  fatcalc,
  @JsonValue('Fatmeasure')
  fatmeasure,
  @JsonValue('Age')
  age,
  @JsonValue('Calorie')
  calorie,
  @JsonValue('MacroProtein')
  macroprotein,
  @JsonValue('MacroFat')
  macrofat,
  @JsonValue('MacroCarb')
  macrocarb
}

const $ChartsTypeMap = {
  ChartsType.weight: 'Weight',
  ChartsType.plan: 'Plan',
  ChartsType.ideal: 'Ideal',
  ChartsType.kd: 'Kd',
  ChartsType.chest: 'Chest',
  ChartsType.underchest: 'Underchest',
  ChartsType.waist: 'Waist',
  ChartsType.stomach: 'Stomach',
  ChartsType.hips: 'Hips',
  ChartsType.biceps: 'Biceps',
  ChartsType.arm: 'Arm',
  ChartsType.wrist: 'Wrist',
  ChartsType.thigh: 'Thigh',
  ChartsType.knee: 'Knee',
  ChartsType.calf: 'Calf',
  ChartsType.ankle: 'Ankle',
  ChartsType.neck: 'Neck',
  ChartsType.clothes: 'Clothes',
  ChartsType.jeans: 'Jeans',
  ChartsType.bmi: 'Bmi',
  ChartsType.mr: 'Mr',
  ChartsType.fatcalc: 'Fatcalc',
  ChartsType.fatmeasure: 'Fatmeasure',
  ChartsType.age: 'Age',
  ChartsType.calorie: 'Calorie',
  ChartsType.macroprotein: 'MacroProtein',
  ChartsType.macrofat: 'MacroFat',
  ChartsType.macrocarb: 'MacroCarb',
  ChartsType.swaggerGeneratedUnknown: 'swaggerGeneratedUnknown'
};

enum IntervalType {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('Day')
  day,
  @JsonValue('Week')
  week,
  @JsonValue('Month')
  month
}

const $IntervalTypeMap = {
  IntervalType.day: 'Day',
  IntervalType.week: 'Week',
  IntervalType.month: 'Month',
  IntervalType.swaggerGeneratedUnknown: 'swaggerGeneratedUnknown'
};

enum ChartsAxisType {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('Kg')
  kg,
  @JsonValue('Sm')
  sm,
  @JsonValue('Percent')
  percent,
  @JsonValue('Number')
  number,
  @JsonValue('Date')
  date,
  @JsonValue('Calorie')
  calorie,
  @JsonValue('Gr')
  gr
}

const $ChartsAxisTypeMap = {
  ChartsAxisType.kg: 'Kg',
  ChartsAxisType.sm: 'Sm',
  ChartsAxisType.percent: 'Percent',
  ChartsAxisType.number: 'Number',
  ChartsAxisType.date: 'Date',
  ChartsAxisType.calorie: 'Calorie',
  ChartsAxisType.gr: 'Gr',
  ChartsAxisType.swaggerGeneratedUnknown: 'swaggerGeneratedUnknown'
};

enum ChartsAdditionType {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('Plan')
  plan,
  @JsonValue('Prediction')
  prediction,
  @JsonValue('Norm')
  norm
}

const $ChartsAdditionTypeMap = {
  ChartsAdditionType.plan: 'Plan',
  ChartsAdditionType.prediction: 'Prediction',
  ChartsAdditionType.norm: 'Norm',
  ChartsAdditionType.swaggerGeneratedUnknown: 'swaggerGeneratedUnknown'
};

enum FoodType {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('Breakfast')
  breakfast,
  @JsonValue('Dinner')
  dinner,
  @JsonValue('Supper')
  supper,
  @JsonValue('Snack')
  snack,
  @JsonValue('SecondBreakfast')
  secondbreakfast,
  @JsonValue('AfternoonSnack')
  afternoonsnack,
  @JsonValue('SecondSupper')
  secondsupper,
  @JsonValue('Snack2')
  snack2,
  @JsonValue('Snack3')
  snack3,
  @JsonValue('Snack4')
  snack4,
  @JsonValue('Snack5')
  snack5
}

const $FoodTypeMap = {
  FoodType.breakfast: 'Breakfast',
  FoodType.dinner: 'Dinner',
  FoodType.supper: 'Supper',
  FoodType.snack: 'Snack',
  FoodType.secondbreakfast: 'SecondBreakfast',
  FoodType.afternoonsnack: 'AfternoonSnack',
  FoodType.secondsupper: 'SecondSupper',
  FoodType.snack2: 'Snack2',
  FoodType.snack3: 'Snack3',
  FoodType.snack4: 'Snack4',
  FoodType.snack5: 'Snack5',
  FoodType.swaggerGeneratedUnknown: 'swaggerGeneratedUnknown'
};
